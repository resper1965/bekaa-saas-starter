'use client';

import { useQuery } from '@tanstack/react-query';
import { useAuth } from '../components/auth-provider';

interface ProductAccess {
  productSlug: string;
  hasAccess: boolean;
  subscription?: {
    status: 'active' | 'trialing' | 'suspended' | 'cancelled';
    seats: number;
    expiresAt: string;
  };
}

export function useProductAccess(productSlug?: string) {
  const { user } = useAuth();

  const { data, isLoading } = useQuery({
    queryKey: ['product-access', user?.uid, productSlug],
    queryFn: async () => {
      if (!user) return null;
      
      const token = await user.getIdToken();
      const apiUrl = process.env.NEXT_PUBLIC_API_URL || 'http://localhost:8080';
      
      const response = await fetch(`${apiUrl}/users/me/product-access`, {
        headers: { 
          'Authorization': `Bearer ${token}`,
          'Content-Type': 'application/json',
        },
      });
      
      if (!response.ok) {
        throw new Error('Failed to fetch product access');
      }
      
      return response.json() as Promise<ProductAccess[]>;
    },
    enabled: !!user,
  });

  if (productSlug) {
    const access = data?.find(p => p.productSlug === productSlug);
    return {
      hasAccess: access?.hasAccess ?? false,
      subscription: access?.subscription,
      isLoading,
    };
  }

  return {
    hasAccess: (slug: string) =>
      data?.find(p => p.productSlug === slug)?.hasAccess ?? false,
    getSubscription: (slug: string) =>
      data?.find(p => p.productSlug === slug)?.subscription,
    allProducts: data ?? [],
    isLoading,
  };
}

