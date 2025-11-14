'use client';

import Link from 'next/link';
import { usePathname, useRouter } from 'next/navigation';
import {
  LayoutDashboard,
  Users,
  CreditCard,
  DollarSign,
  Video,
  Settings,
  FileText,
  LogOut,
} from 'lucide-react';
import { clearAuth, getAdminData } from '@/lib/auth';

const navItems = [
  { href: '/dashboard', label: 'Dashboard', icon: LayoutDashboard },
  { href: '/dashboard/users', label: 'Users', icon: Users },
  { href: '/dashboard/subscriptions', label: 'Subscriptions', icon: CreditCard },
  { href: '/dashboard/payments', label: 'Payments', icon: DollarSign },
  { href: '/dashboard/rooms', label: 'Rooms', icon: Video },
  { href: '/dashboard/settings', label: 'Settings', icon: Settings },
  { href: '/dashboard/audit-logs', label: 'Audit Logs', icon: FileText },
];

export default function Sidebar() {
  const pathname = usePathname();
  const router = useRouter();
  const admin = getAdminData();

  const handleLogout = () => {
    clearAuth();
    router.push('/login');
  };

  return (
    <div className="w-64 bg-gray-900 text-white min-h-screen flex flex-col">
      <div className="p-6 border-b border-gray-800">
        <h1 className="text-2xl font-bold">Calling App</h1>
        <p className="text-sm text-gray-400 mt-1">Admin Dashboard</p>
      </div>

      <nav className="flex-1 p-4">
        <ul className="space-y-2">
          {navItems.map((item) => {
            const Icon = item.icon;
            const isActive = pathname === item.href;

            return (
              <li key={item.href}>
                <Link
                  href={item.href}
                  className={`flex items-center space-x-3 px-4 py-3 rounded-lg transition-colors ${
                    isActive
                      ? 'bg-primary-600 text-white'
                      : 'text-gray-300 hover:bg-gray-800'
                  }`}
                >
                  <Icon size={20} />
                  <span>{item.label}</span>
                </Link>
              </li>
            );
          })}
        </ul>
      </nav>

      <div className="p-4 border-t border-gray-800">
        <div className="mb-4 px-4">
          <p className="text-sm text-gray-400">Logged in as</p>
          <p className="font-medium truncate">{admin?.email}</p>
          <span className="inline-block mt-1 px-2 py-1 text-xs rounded bg-primary-600">
            {admin?.role === 'super_admin' ? 'Super Admin' : 'Admin'}
          </span>
        </div>
        <button
          onClick={handleLogout}
          className="w-full flex items-center space-x-3 px-4 py-3 rounded-lg text-gray-300 hover:bg-gray-800 transition-colors"
        >
          <LogOut size={20} />
          <span>Logout</span>
        </button>
      </div>
    </div>
  );
}
