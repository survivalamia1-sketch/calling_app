'use client';

import { useEffect, useState } from 'react';
import { analyticsAPI } from '@/lib/api';
import { formatCurrency, formatNumber } from '@/lib/utils';
import { Users, DollarSign, Video, TrendingUp } from 'lucide-react';
import { LineChart, Line, XAxis, YAxis, CartesianGrid, Tooltip, ResponsiveContainer } from 'recharts';

interface DashboardStats {
  total_users: number;
  active_users: number;
  total_revenue: number;
  monthly_revenue: number;
  active_meetings: number;
  total_meetings_today: number;
  new_signups_today: number;
  new_signups_this_week: number;
}

interface ChartData {
  date: string;
  value: number;
}

export default function DashboardPage() {
  const [stats, setStats] = useState<DashboardStats | null>(null);
  const [revenueChart, setRevenueChart] = useState<ChartData[]>([]);
  const [signupsChart, setSignupsChart] = useState<ChartData[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetchDashboardData();
  }, []);

  const fetchDashboardData = async () => {
    try {
      const [statsRes, revenueRes, signupsRes] = await Promise.all([
        analyticsAPI.getDashboard(),
        analyticsAPI.getRevenue(30),
        analyticsAPI.getSignups(30),
      ]);

      setStats(statsRes.data);
      setRevenueChart(revenueRes.data);
      setSignupsChart(signupsRes.data);
    } catch (error) {
      console.error('Failed to fetch dashboard data:', error);
    } finally {
      setLoading(false);
    }
  };

  if (loading) {
    return (
      <div className="flex items-center justify-center min-h-[400px]">
        <div className="spinner"></div>
      </div>
    );
  }

  const kpiCards = [
    {
      title: 'Total Users',
      value: formatNumber(stats?.total_users || 0),
      subtitle: `${formatNumber(stats?.active_users || 0)} active`,
      icon: Users,
      color: 'bg-blue-500',
    },
    {
      title: 'Monthly Revenue',
      value: formatCurrency((stats?.monthly_revenue || 0) / 100),
      subtitle: `Total: ${formatCurrency((stats?.total_revenue || 0) / 100)}`,
      icon: DollarSign,
      color: 'bg-green-500',
    },
    {
      title: 'Active Meetings',
      value: formatNumber(stats?.active_meetings || 0),
      subtitle: `${formatNumber(stats?.total_meetings_today || 0)} today`,
      icon: Video,
      color: 'bg-purple-500',
    },
    {
      title: 'New Signups',
      value: formatNumber(stats?.new_signups_today || 0),
      subtitle: `${formatNumber(stats?.new_signups_this_week || 0)} this week`,
      icon: TrendingUp,
      color: 'bg-orange-500',
    },
  ];

  return (
    <div>
      <div className="mb-8">
        <h1 className="text-3xl font-bold text-gray-900">Dashboard</h1>
        <p className="text-gray-600 mt-2">Overview of your platform metrics</p>
      </div>

      {/* KPI Cards */}
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-8">
        {kpiCards.map((card, index) => {
          const Icon = card.icon;
          return (
            <div key={index} className="bg-white rounded-lg shadow p-6">
              <div className="flex items-center justify-between mb-4">
                <div className={`${card.color} p-3 rounded-lg`}>
                  <Icon className="text-white" size={24} />
                </div>
              </div>
              <h3 className="text-gray-600 text-sm font-medium">{card.title}</h3>
              <p className="text-3xl font-bold text-gray-900 mt-2">{card.value}</p>
              <p className="text-sm text-gray-500 mt-1">{card.subtitle}</p>
            </div>
          );
        })}
      </div>

      {/* Charts */}
      <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
        {/* Revenue Chart */}
        <div className="bg-white rounded-lg shadow p-6">
          <h2 className="text-xl font-bold text-gray-900 mb-4">Revenue (Last 30 Days)</h2>
          <ResponsiveContainer width="100%" height={300}>
            <LineChart data={revenueChart}>
              <CartesianGrid strokeDasharray="3 3" />
              <XAxis dataKey="date" />
              <YAxis />
              <Tooltip
                formatter={(value: number) => formatCurrency(value / 100)}
              />
              <Line
                type="monotone"
                dataKey="value"
                stroke="#10b981"
                strokeWidth={2}
                dot={{ fill: '#10b981' }}
              />
            </LineChart>
          </ResponsiveContainer>
        </div>

        {/* Signups Chart */}
        <div className="bg-white rounded-lg shadow p-6">
          <h2 className="text-xl font-bold text-gray-900 mb-4">New Signups (Last 30 Days)</h2>
          <ResponsiveContainer width="100%" height={300}>
            <LineChart data={signupsChart}>
              <CartesianGrid strokeDasharray="3 3" />
              <XAxis dataKey="date" />
              <YAxis />
              <Tooltip />
              <Line
                type="monotone"
                dataKey="value"
                stroke="#3b82f6"
                strokeWidth={2}
                dot={{ fill: '#3b82f6' }}
              />
            </LineChart>
          </ResponsiveContainer>
        </div>
      </div>
    </div>
  );
}
