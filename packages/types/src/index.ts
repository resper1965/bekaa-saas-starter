// User & Auth Types
export interface User {
  id: string;
  email: string;
  name: string;
  organizationId: string;
  role: UserRole;
  createdAt: Date;
  updatedAt: Date;
}

export enum UserRole {
  ADMIN = 'admin',
  MEMBER = 'member',
  VIEWER = 'viewer',
}

// Organization & Tenant Types
export interface Organization {
  id: string;
  name: string;
  slug: string;
  domain?: string;
  createdAt: Date;
  updatedAt: Date;
}

// Product Types
export interface Product {
  id: string;
  slug: string;
  name: string;
  description: string;
  basePrice: number;
  active: boolean;
  createdAt: Date;
  updatedAt: Date;
}

export enum ProductSlug {
  PRIVACY = 'privacy',
  COMPLIANCE = 'compliance',
  SOC = 'soc',
  SIEM = 'siem',
  DOCS = 'docs',
  PROJECTS = 'projects',
}

// Subscription Types
export interface OrganizationSubscription {
  id: string;
  organizationId: string;
  productId: string;
  status: SubscriptionStatus;
  seats: number;
  startDate: Date;
  endDate?: Date;
  stripeSubscriptionId?: string;
  stripeCustomerId?: string;
  createdAt: Date;
  updatedAt: Date;
}

export enum SubscriptionStatus {
  ACTIVE = 'active',
  INACTIVE = 'inactive',
  EXPIRED = 'expired',
  CANCELLED = 'cancelled',
  TRIALING = 'trialing',
  SUSPENDED = 'suspended',
}

// API Response Types
export interface ApiResponse<T = unknown> {
  success: boolean;
  data?: T;
  error?: string;
  message?: string;
}

// Request Context Types
export interface RequestContext {
  user: User;
  organization: Organization;
  subscriptions: OrganizationSubscription[];
}

