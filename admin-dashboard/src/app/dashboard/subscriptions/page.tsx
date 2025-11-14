'use client';

import { useEffect, useState } from 'react';
import { subscriptionsAPI } from '@/lib/api';
import { formatDate, formatCurrency, getStatusColor, getPlanBadgeColor } from '@/lib/utils';
import { showSuccess, showError, getErrorMessage } from '@/lib/toast';
import { Search, TrendingUp, Calendar, XCircle } from 'lucide-react';

interface Subscription {
  id: string;
  user_id: string;
  user_email: string;
  user_name: string;
  plan_type: string;
  status: string;
  current_period_start: string;
  current_period_end: string;
  cancel_at_period_end: boolean;
  created_at: string;
}

export default function SubscriptionsPage() {
  const [subscriptions, setSubscriptions] = useState<Subscription[]>([]);
  const [loading, setLoading] = useState(true);
  const [searchTerm, setSearchTerm] = useState('');
  const [statusFilter, setStatusFilter] = useState('');
  const [planFilter, setPlanFilter] = useState('');
  const [currentPage, setCurrentPage] = useState(1);
  const [totalPages, setTotalPages] = useState(1);

  useEffect(() => {
    fetchSubscriptions();
  }, [currentPage, statusFilter, planFilter]);

  const fetchSubscriptions = async () => {
    setLoading(true);
    try {
      const response = await subscriptionsAPI.getAll({
        page: currentPage,
        limit: 20,
        status: statusFilter || undefined,
        plan_type: planFilter || undefined,
        search: searchTerm || undefined,
      });
      setSubscriptions(response.data.subscriptions);
      setTotalPages(response.data.total_pages);
    } catch (error) {
      console.error('Failed to fetch subscriptions:', error);
    } finally {
      setLoading(false);
    }
  };

  const handleUpgrade = async (userId: string) => {
    const newPlan = prompt('Enter new plan type (free, pro, business):');
    if (!newPlan || !['free', 'pro', 'business'].includes(newPlan.toLowerCase())) {
      showError('Invalid plan type');
      return;
    }

    try {
      await subscriptionsAPI.upgrade(userId, newPlan.toLowerCase());
      fetchSubscriptions();
      showSuccess('Subscription upgraded successfully');
    } catch (error) {
      showError(getErrorMessage(error));
    }
  };

  const handleExtend = async (subscriptionId: string) => {
    const days = prompt('Enter number of days to extend:');
    if (!days || isNaN(Number(days))) {
      showError('Invalid number of days');
      return;
    }

    try {
      await subscriptionsAPI.extend(subscriptionId, Number(days));
      fetchSubscriptions();
      showSuccess('Subscription extended successfully');
    } catch (error) {
      showError(getErrorMessage(error));
    }
  };

  const handleCancel = async (subscriptionId: string) => {
    if (!confirm('Are you sure you want to cancel this subscription?')) return;

    try {
      await subscriptionsAPI.cancel(subscriptionId);
      fetchSubscriptions();
      showSuccess('Subscription cancelled successfully');
    } catch (error) {
      showError(getErrorMessage(error));
    }
  };

  const handleSearch = (e: React.FormEvent) => {
    e.preventDefault();
    setCurrentPage(1);
    fetchSubscriptions();
  };

  return (
    <div>
      <div className="mb-8">
        <h1 className="text-3xl font-bold text-gray-900">Subscriptions</h1>
        <p className="text-gray-600 mt-2">Manage user subscriptions and plans</p>
      </div>

      {/* Filters */}
      <div className="mb-6 space-y-4">
        <form onSubmit={handleSearch} className="flex gap-2">
          <div className="relative flex-1">
            <Search className="absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400" size={20} />
            <input
              type="text"
              placeholder="Search by user email..."
              value={searchTerm}
              onChange={(e) => setSearchTerm(e.target.value)}
              className="w-full pl-10 pr-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-transparent"
            />
          </div>
          <button
            type="submit"
            className="px-6 py-2 bg-primary-600 text-white rounded-lg hover:bg-primary-700 transition-colors"
          >
            Search
          </button>
        </form>

        <div className="flex gap-4">
          <select
            value={statusFilter}
            onChange={(e) => { setStatusFilter(e.target.value); setCurrentPage(1); }}
            className="px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-transparent"
          >
            <option value="">All Statuses</option>
            <option value="active">Active</option>
            <option value="canceled">Canceled</option>
            <option value="past_due">Past Due</option>
            <option value="trialing">Trialing</option>
          </select>

          <select
            value={planFilter}
            onChange={(e) => { setPlanFilter(e.target.value); setCurrentPage(1); }}
            className="px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-transparent"
          >
            <option value="">All Plans</option>
            <option value="free">Free</option>
            <option value="pro">Pro</option>
            <option value="business">Business</option>
          </select>
        </div>
      </div>

      {/* Subscriptions Table */}
      <div className="bg-white rounded-lg shadow overflow-hidden">
        <div className="overflow-x-auto">
          <table className="min-w-full divide-y divide-gray-200">
            <thead className="bg-gray-50">
              <tr>
                <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                  User
                </th>
                <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                  Plan
                </th>
                <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                  Status
                </th>
                <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                  Period
                </th>
                <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                  Actions
                </th>
              </tr>
            </thead>
            <tbody className="bg-white divide-y divide-gray-200">
              {loading ? (
                <tr>
                  <td colSpan={5} className="px-6 py-12 text-center">
                    <div className="flex justify-center">
                      <div className="spinner"></div>
                    </div>
                  </td>
                </tr>
              ) : subscriptions.length === 0 ? (
                <tr>
                  <td colSpan={5} className="px-6 py-12 text-center text-gray-500">
                    No subscriptions found
                  </td>
                </tr>
              ) : (
                subscriptions.map((sub) => (
                  <tr key={sub.id} className="hover:bg-gray-50">
                    <td className="px-6 py-4 whitespace-nowrap">
                      <div>
                        <div className="font-medium text-gray-900">{sub.user_name}</div>
                        <div className="text-sm text-gray-500">{sub.user_email}</div>
                      </div>
                    </td>
                    <td className="px-6 py-4 whitespace-nowrap">
                      <span className={`px-2 py-1 inline-flex text-xs leading-5 font-semibold rounded-full ${getPlanBadgeColor(sub.plan_type)}`}>
                        {sub.plan_type.toUpperCase()}
                      </span>
                    </td>
                    <td className="px-6 py-4 whitespace-nowrap">
                      <span className={`px-2 py-1 inline-flex text-xs leading-5 font-semibold rounded-full ${getStatusColor(sub.status)}`}>
                        {sub.status}
                      </span>
                      {sub.cancel_at_period_end && (
                        <span className="ml-2 text-xs text-red-600">(Canceling)</span>
                      )}
                    </td>
                    <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-600">
                      <div>{formatDate(sub.current_period_start)}</div>
                      <div className="text-xs text-gray-500">to {formatDate(sub.current_period_end)}</div>
                    </td>
                    <td className="px-6 py-4 whitespace-nowrap text-sm font-medium space-x-2">
                      <button
                        onClick={() => handleUpgrade(sub.user_id)}
                        className="text-blue-600 hover:text-blue-900"
                        title="Change Plan"
                      >
                        <TrendingUp size={18} />
                      </button>
                      <button
                        onClick={() => handleExtend(sub.id)}
                        className="text-green-600 hover:text-green-900"
                        title="Extend Period"
                      >
                        <Calendar size={18} />
                      </button>
                      <button
                        onClick={() => handleCancel(sub.id)}
                        className="text-red-600 hover:text-red-900"
                        title="Cancel Subscription"
                      >
                        <XCircle size={18} />
                      </button>
                    </td>
                  </tr>
                ))
              )}
            </tbody>
          </table>
        </div>

        {/* Pagination */}
        {totalPages > 1 && (
          <div className="bg-white px-4 py-3 border-t border-gray-200 sm:px-6">
            <div className="flex items-center justify-between">
              <button
                onClick={() => setCurrentPage((prev) => Math.max(1, prev - 1))}
                disabled={currentPage === 1}
                className="px-4 py-2 border border-gray-300 text-sm font-medium rounded-md text-gray-700 bg-white hover:bg-gray-50 disabled:opacity-50 disabled:cursor-not-allowed"
              >
                Previous
              </button>
              <span className="text-sm text-gray-700">
                Page {currentPage} of {totalPages}
              </span>
              <button
                onClick={() => setCurrentPage((prev) => Math.min(totalPages, prev + 1))}
                disabled={currentPage === totalPages}
                className="px-4 py-2 border border-gray-300 text-sm font-medium rounded-md text-gray-700 bg-white hover:bg-gray-50 disabled:opacity-50 disabled:cursor-not-allowed"
              >
                Next
              </button>
            </div>
          </div>
        )}
      </div>
    </div>
  );
}
