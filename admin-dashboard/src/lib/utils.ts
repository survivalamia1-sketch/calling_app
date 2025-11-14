export function formatCurrency(amount: number): string {
  return new Intl.NumberFormat('en-US', {
    style: 'currency',
    currency: 'USD',
  }).format(amount);
}

export function formatDate(date: string | Date): string {
  return new Intl.DateTimeFormat('en-US', {
    year: 'numeric',
    month: 'short',
    day: 'numeric',
    hour: '2-digit',
    minute: '2-digit',
  }).format(new Date(date));
}

export function formatDateShort(date: string | Date): string {
  return new Intl.DateTimeFormat('en-US', {
    year: 'numeric',
    month: 'short',
    day: 'numeric',
  }).format(new Date(date));
}

export function formatNumber(num: number): string {
  return new Intl.NumberFormat('en-US').format(num);
}

export function cn(...classes: (string | boolean | undefined)[]): string {
  return classes.filter(Boolean).join(' ');
}

export function getStatusColor(status: string): string {
  const colors: Record<string, string> = {
    active: 'bg-green-100 text-green-800',
    inactive: 'bg-gray-100 text-gray-800',
    canceled: 'bg-red-100 text-red-800',
    past_due: 'bg-yellow-100 text-yellow-800',
    trialing: 'bg-blue-100 text-blue-800',
    succeeded: 'bg-green-100 text-green-800',
    failed: 'bg-red-100 text-red-800',
    refunded: 'bg-orange-100 text-orange-800',
    pending: 'bg-yellow-100 text-yellow-800',
    ended: 'bg-gray-100 text-gray-800',
    waiting: 'bg-yellow-100 text-yellow-800',
    scheduled: 'bg-blue-100 text-blue-800',
  };
  return colors[status.toLowerCase()] || 'bg-gray-100 text-gray-800';
}

export function getPlanBadgeColor(planType: string): string {
  const colors: Record<string, string> = {
    free: 'bg-gray-100 text-gray-800',
    pro: 'bg-blue-100 text-blue-800',
    business: 'bg-purple-100 text-purple-800',
  };
  return colors[planType.toLowerCase()] || 'bg-gray-100 text-gray-800';
}
