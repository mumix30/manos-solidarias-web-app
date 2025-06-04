
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import { supabase } from '@/integrations/supabase/client';
import { useToast } from '@/hooks/use-toast';

// Types for our database entities
export interface Member {
  id: string;
  member_code: string;
  first_name: string;
  last_name: string;
  identification: string;
  birth_date?: string;
  email?: string;
  phone?: string;
  address?: string;
  country?: string;
  state?: string;
  city?: string;
  status: 'Activo' | 'Inactivo' | 'Suspendido';
  organization_id?: string;
  join_date?: string;
  created_at: string;
  updated_at: string;
}

export interface Organization {
  id: string;
  name: string;
  description?: string;
  address?: string;
  phone?: string;
  email?: string;
  created_at: string;
  updated_at: string;
}

export interface Loan {
  id: string;
  loan_code: string;
  member_id: string;
  loan_type: 'Préstamo Personal' | 'Préstamo Comercial' | 'Préstamo Vivienda' | 'Préstamo Educativo' | 'Préstamo Emergencia';
  amount: string;
  interest_rate: string;
  term_months: number;
  monthly_payment?: string;
  purpose?: string;
  guarantor1?: string;
  guarantor2?: string;
  status: 'Pendiente' | 'En Revisión' | 'Aprobado' | 'Rechazado' | 'Activo' | 'Completado';
  request_date?: string;
  approval_date?: string;
  disbursement_date?: string;
  created_at: string;
  updated_at: string;
  members?: Member;
}

export interface SavingsAccount {
  id: string;
  member_id: string;
  account_number: string;
  savings_type: 'Ahorro Regular' | 'Ahorro Programado' | 'Ahorro Navideño' | 'Ahorro Vacacional';
  balance: string;
  target_amount?: string;
  monthly_contribution?: string;
  start_date?: string;
  end_date?: string;
  is_active: boolean;
  created_at: string;
  updated_at: string;
  members?: Member;
}

// Hook for members
export const useMembers = () => {
  return useQuery({
    queryKey: ['members'],
    queryFn: async () => {
      const { data, error } = await supabase
        .from('members')
        .select('*, organizations(name)')
        .order('created_at', { ascending: false });
      
      if (error) throw error;
      return data as (Member & { organizations?: { name: string } })[];
    }
  });
};

// Hook for organizations
export const useOrganizations = () => {
  return useQuery({
    queryKey: ['organizations'],
    queryFn: async () => {
      const { data, error } = await supabase
        .from('organizations')
        .select('*')
        .order('name');
      
      if (error) throw error;
      return data as Organization[];
    }
  });
};

// Hook for loans
export const useLoans = () => {
  return useQuery({
    queryKey: ['loans'],
    queryFn: async () => {
      const { data, error } = await supabase
        .from('loans')
        .select('*, members(first_name, last_name)')
        .order('created_at', { ascending: false });
      
      if (error) throw error;
      return data as (Loan & { members?: { first_name: string; last_name: string } })[];
    }
  });
};

// Hook for savings accounts
export const useSavingsAccounts = () => {
  return useQuery({
    queryKey: ['savings_accounts'],
    queryFn: async () => {
      const { data, error } = await supabase
        .from('savings_accounts')
        .select('*, members(first_name, last_name)')
        .order('created_at', { ascending: false });
      
      if (error) throw error;
      return data as (SavingsAccount & { members?: { first_name: string; last_name: string } })[];
    }
  });
};

// Mutation hooks for creating/updating data
export const useCreateMember = () => {
  const queryClient = useQueryClient();
  const { toast } = useToast();

  return useMutation({
    mutationFn: async (memberData: Omit<Member, 'id' | 'member_code' | 'created_at' | 'updated_at'>) => {
      const { data, error } = await supabase
        .from('members')
        .insert([memberData])
        .select()
        .single();
      
      if (error) throw error;
      return data;
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['members'] });
      toast({
        title: "Éxito",
        description: "Miembro creado exitosamente"
      });
    },
    onError: (error) => {
      console.error('Error creating member:', error);
      toast({
        title: "Error",
        description: "No se pudo crear el miembro",
        variant: "destructive"
      });
    }
  });
};

export const useCreateLoan = () => {
  const queryClient = useQueryClient();
  const { toast } = useToast();

  return useMutation({
    mutationFn: async (loanData: Omit<Loan, 'id' | 'loan_code' | 'monthly_payment' | 'created_at' | 'updated_at'>) => {
      const { data, error } = await supabase
        .from('loans')
        .insert([loanData])
        .select()
        .single();
      
      if (error) throw error;
      return data;
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['loans'] });
      toast({
        title: "Éxito",
        description: "Préstamo creado exitosamente"
      });
    },
    onError: (error) => {
      console.error('Error creating loan:', error);
      toast({
        title: "Error",
        description: "No se pudo crear el préstamo",
        variant: "destructive"
      });
    }
  });
};

export const useCreateSavingsAccount = () => {
  const queryClient = useQueryClient();
  const { toast } = useToast();

  return useMutation({
    mutationFn: async (savingsData: Omit<SavingsAccount, 'id' | 'account_number' | 'balance' | 'created_at' | 'updated_at'>) => {
      // Generate account number
      const accountNumber = `AH${Date.now().toString().slice(-6)}`;
      
      const { data, error } = await supabase
        .from('savings_accounts')
        .insert([{ ...savingsData, account_number: accountNumber }])
        .select()
        .single();
      
      if (error) throw error;
      return data;
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['savings_accounts'] });
      toast({
        title: "Éxito",
        description: "Cuenta de ahorro creada exitosamente"
      });
    },
    onError: (error) => {
      console.error('Error creating savings account:', error);
      toast({
        title: "Error",
        description: "No se pudo crear la cuenta de ahorro",
        variant: "destructive"
      });
    }
  });
};
