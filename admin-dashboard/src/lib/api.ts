import axios from 'axios';

const API_URL = process.env.NEXT_PUBLIC_API_URL || 'http://localhost:8080/api/v1';

// Create axios instance
const api = axios.create({
  baseURL: API_URL,
  headers: {
    'Content-Type': 'application/json',
  },
});

// Add auth token to requests
api.interceptors.request.use((config) => {
  if (typeof window !== 'undefined') {
    const token = localStorage.getItem('admin_token');
    if (token) {
      config.headers.Authorization = `Bearer ${token}`;
    }
  }
  return config;
});

// Handle 401 errors
api.interceptors.response.use(
  (response) => response,
  (error) => {
    if (error.response?.status === 401) {
      if (typeof window !== 'undefined') {
        localStorage.removeItem('admin_token');
        localStorage.removeItem('admin_data');
        window.location.href = '/login';
      }
    }
    return Promise.reject(error);
  }
);

export default api;

// Auth API
export const authAPI = {
  login: (email: string, password: string) =>
    api.post('/admin/auth/login', { email, password }),

  getProfile: () =>
    api.get('/admin/auth/profile'),

  changePassword: (oldPassword: string, newPassword: string) =>
    api.post('/admin/auth/change-password', { old_password: oldPassword, new_password: newPassword }),
};

// Users API
export const usersAPI = {
  getAll: (params?: any) =>
    api.get('/admin/users', { params }),

  getDetails: (userId: string) =>
    api.get(`/admin/users/${userId}`),

  activate: (userId: string) =>
    api.post(`/admin/users/${userId}/activate`),

  deactivate: (userId: string) =>
    api.post(`/admin/users/${userId}/deactivate`),

  resetPassword: (userId: string, newPassword: string) =>
    api.post(`/admin/users/${userId}/reset-password`, { new_password: newPassword }),
};

// Subscriptions API
export const subscriptionsAPI = {
  getAll: (params?: any) =>
    api.get('/admin/subscriptions', { params }),

  upgrade: (userId: string, planType: string) =>
    api.post(`/admin/subscriptions/upgrade/${userId}`, { plan_type: planType }),

  extend: (subscriptionId: string, days: number) =>
    api.post(`/admin/subscriptions/${subscriptionId}/extend`, { days }),

  cancel: (subscriptionId: string) =>
    api.post(`/admin/subscriptions/${subscriptionId}/cancel`),
};

// Rooms API
export const roomsAPI = {
  getAll: (params?: any) =>
    api.get('/admin/rooms', { params }),

  forceEnd: (roomId: string) =>
    api.post(`/admin/rooms/${roomId}/end`),
};

// Analytics API
export const analyticsAPI = {
  getDashboard: () =>
    api.get('/admin/analytics/dashboard'),

  getRevenue: (days: number = 30) =>
    api.get(`/admin/analytics/revenue?days=${days}`),

  getSignups: (days: number = 30) =>
    api.get(`/admin/analytics/signups?days=${days}`),
};

// Payments API
export const paymentsAPI = {
  getAll: (params?: any) =>
    api.get('/admin/payments', { params }),
};

// Settings API
export const settingsAPI = {
  getAll: () =>
    api.get('/admin/settings'),

  update: (key: string, value: string) =>
    api.put('/admin/settings', { key, value }),
};

// Audit Logs API
export const auditLogsAPI = {
  getAll: (params?: any) =>
    api.get('/admin/audit-logs', { params }),
};

// Admins API
export const adminsAPI = {
  create: (data: any) =>
    api.post('/admin/admins', data),
};
