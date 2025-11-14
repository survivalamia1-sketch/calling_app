export interface AdminData {
  id: string;
  email: string;
  first_name: string;
  last_name: string;
  role: 'admin' | 'super_admin';
  is_active: boolean;
  created_at: string;
}

export const setAuthToken = (token: string) => {
  localStorage.setItem('admin_token', token);
};

export const setAdminData = (data: AdminData) => {
  localStorage.setItem('admin_data', JSON.stringify(data));
};

export const getAuthToken = (): string | null => {
  return localStorage.getItem('admin_token');
};

export const getAdminData = (): AdminData | null => {
  const data = localStorage.getItem('admin_data');
  return data ? JSON.parse(data) : null;
};

export const clearAuth = () => {
  localStorage.removeItem('admin_token');
  localStorage.removeItem('admin_data');
};

export const isAuthenticated = (): boolean => {
  return !!getAuthToken();
};

export const isSuperAdmin = (): boolean => {
  const admin = getAdminData();
  return admin?.role === 'super_admin';
};
