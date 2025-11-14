'use client';

import { useEffect, useState } from 'react';
import { settingsAPI, authAPI } from '@/lib/api';
import { Save, Lock } from 'lucide-react';

interface SystemSetting {
  key: string;
  value: string;
  description: string;
}

export default function SettingsPage() {
  const [settings, setSettings] = useState<SystemSetting[]>([]);
  const [loading, setLoading] = useState(true);
  const [saving, setSaving] = useState(false);
  const [editedSettings, setEditedSettings] = useState<Record<string, string>>({});

  // Password change
  const [oldPassword, setOldPassword] = useState('');
  const [newPassword, setNewPassword] = useState('');
  const [confirmPassword, setConfirmPassword] = useState('');
  const [passwordLoading, setPasswordLoading] = useState(false);

  useEffect(() => {
    fetchSettings();
  }, []);

  const fetchSettings = async () => {
    setLoading(true);
    try {
      const response = await settingsAPI.getAll();
      setSettings(response.data.settings);

      // Initialize edited settings
      const initial: Record<string, string> = {};
      response.data.settings.forEach((setting: SystemSetting) => {
        initial[setting.key] = setting.value;
      });
      setEditedSettings(initial);
    } catch (error) {
      console.error('Failed to fetch settings:', error);
    } finally {
      setLoading(false);
    }
  };

  const handleSettingChange = (key: string, value: string) => {
    setEditedSettings((prev) => ({
      ...prev,
      [key]: value,
    }));
  };

  const handleSaveSettings = async () => {
    setSaving(true);
    try {
      // Save all changed settings
      const promises = Object.entries(editedSettings).map(([key, value]) => {
        const original = settings.find((s) => s.key === key);
        if (original && original.value !== value) {
          return settingsAPI.update(key, value);
        }
        return null;
      }).filter(Boolean);

      await Promise.all(promises);
      await fetchSettings();
      alert('Settings saved successfully');
    } catch (error) {
      alert('Failed to save settings');
    } finally {
      setSaving(false);
    }
  };

  const handleChangePassword = async (e: React.FormEvent) => {
    e.preventDefault();

    if (newPassword !== confirmPassword) {
      alert('New passwords do not match');
      return;
    }

    if (newPassword.length < 8) {
      alert('Password must be at least 8 characters long');
      return;
    }

    setPasswordLoading(true);
    try {
      await authAPI.changePassword(oldPassword, newPassword);
      alert('Password changed successfully');
      setOldPassword('');
      setNewPassword('');
      setConfirmPassword('');
    } catch (error: any) {
      alert(error.response?.data?.error || 'Failed to change password');
    } finally {
      setPasswordLoading(false);
    }
  };

  if (loading) {
    return (
      <div className="flex items-center justify-center min-h-[400px]">
        <div className="spinner"></div>
      </div>
    );
  }

  return (
    <div>
      <div className="mb-8">
        <h1 className="text-3xl font-bold text-gray-900">Settings</h1>
        <p className="text-gray-600 mt-2">Manage system settings and your account</p>
      </div>

      <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
        {/* System Settings */}
        <div className="bg-white rounded-lg shadow p-6">
          <h2 className="text-xl font-bold text-gray-900 mb-4">System Settings</h2>

          <div className="space-y-4">
            {settings.map((setting) => (
              <div key={setting.key}>
                <label className="block text-sm font-medium text-gray-700 mb-1">
                  {setting.key.split('_').map(word => word.charAt(0).toUpperCase() + word.slice(1)).join(' ')}
                </label>
                {setting.description && (
                  <p className="text-xs text-gray-500 mb-2">{setting.description}</p>
                )}
                <input
                  type="text"
                  value={editedSettings[setting.key] || ''}
                  onChange={(e) => handleSettingChange(setting.key, e.target.value)}
                  className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-transparent"
                />
              </div>
            ))}

            <button
              onClick={handleSaveSettings}
              disabled={saving}
              className="w-full mt-4 flex items-center justify-center gap-2 px-6 py-2 bg-primary-600 text-white rounded-lg hover:bg-primary-700 transition-colors disabled:opacity-50 disabled:cursor-not-allowed"
            >
              <Save size={18} />
              {saving ? 'Saving...' : 'Save Settings'}
            </button>
          </div>
        </div>

        {/* Change Password */}
        <div className="bg-white rounded-lg shadow p-6">
          <h2 className="text-xl font-bold text-gray-900 mb-4 flex items-center gap-2">
            <Lock size={20} />
            Change Password
          </h2>

          <form onSubmit={handleChangePassword} className="space-y-4">
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">
                Current Password
              </label>
              <input
                type="password"
                required
                value={oldPassword}
                onChange={(e) => setOldPassword(e.target.value)}
                className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-transparent"
              />
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">
                New Password
              </label>
              <input
                type="password"
                required
                minLength={8}
                value={newPassword}
                onChange={(e) => setNewPassword(e.target.value)}
                className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-transparent"
              />
              <p className="text-xs text-gray-500 mt-1">Must be at least 8 characters</p>
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">
                Confirm New Password
              </label>
              <input
                type="password"
                required
                value={confirmPassword}
                onChange={(e) => setConfirmPassword(e.target.value)}
                className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-transparent"
              />
            </div>

            <button
              type="submit"
              disabled={passwordLoading}
              className="w-full flex items-center justify-center gap-2 px-6 py-2 bg-primary-600 text-white rounded-lg hover:bg-primary-700 transition-colors disabled:opacity-50 disabled:cursor-not-allowed"
            >
              <Lock size={18} />
              {passwordLoading ? 'Changing...' : 'Change Password'}
            </button>
          </form>

          <div className="mt-6 p-4 bg-yellow-50 border border-yellow-200 rounded-lg">
            <p className="text-sm text-yellow-800">
              <strong>Security Tip:</strong> Use a strong password with a mix of letters, numbers, and special characters.
            </p>
          </div>
        </div>
      </div>

      {/* Additional Info */}
      <div className="mt-6 bg-blue-50 border border-blue-200 rounded-lg p-4">
        <h3 className="font-semibold text-blue-900 mb-2">About System Settings</h3>
        <p className="text-sm text-blue-800">
          System settings control various aspects of the platform. Changes take effect immediately.
          Make sure to verify settings after saving to ensure they are correctly applied.
        </p>
      </div>
    </div>
  );
}
