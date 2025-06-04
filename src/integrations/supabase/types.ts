export type Json =
  | string
  | number
  | boolean
  | null
  | { [key: string]: Json | undefined }
  | Json[]

export type Database = {
  public: {
    Tables: {
      loans: {
        Row: {
          amount: number
          approval_date: string | null
          created_at: string | null
          disbursement_date: string | null
          guarantor1: string | null
          guarantor2: string | null
          id: string
          interest_rate: number | null
          loan_code: string
          loan_type: Database["public"]["Enums"]["loan_type"]
          member_id: string | null
          monthly_payment: number | null
          purpose: string | null
          request_date: string | null
          status: Database["public"]["Enums"]["loan_status"] | null
          term_months: number
          updated_at: string | null
        }
        Insert: {
          amount: number
          approval_date?: string | null
          created_at?: string | null
          disbursement_date?: string | null
          guarantor1?: string | null
          guarantor2?: string | null
          id?: string
          interest_rate?: number | null
          loan_code: string
          loan_type: Database["public"]["Enums"]["loan_type"]
          member_id?: string | null
          monthly_payment?: number | null
          purpose?: string | null
          request_date?: string | null
          status?: Database["public"]["Enums"]["loan_status"] | null
          term_months: number
          updated_at?: string | null
        }
        Update: {
          amount?: number
          approval_date?: string | null
          created_at?: string | null
          disbursement_date?: string | null
          guarantor1?: string | null
          guarantor2?: string | null
          id?: string
          interest_rate?: number | null
          loan_code?: string
          loan_type?: Database["public"]["Enums"]["loan_type"]
          member_id?: string | null
          monthly_payment?: number | null
          purpose?: string | null
          request_date?: string | null
          status?: Database["public"]["Enums"]["loan_status"] | null
          term_months?: number
          updated_at?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "loans_member_id_fkey"
            columns: ["member_id"]
            isOneToOne: false
            referencedRelation: "members"
            referencedColumns: ["id"]
          },
        ]
      }
      members: {
        Row: {
          address: string | null
          birth_date: string | null
          city: string | null
          country: string | null
          created_at: string | null
          email: string | null
          first_name: string
          id: string
          identification: string
          join_date: string | null
          last_name: string
          member_code: string
          organization_id: string | null
          phone: string | null
          state: string | null
          status: Database["public"]["Enums"]["member_status"] | null
          updated_at: string | null
        }
        Insert: {
          address?: string | null
          birth_date?: string | null
          city?: string | null
          country?: string | null
          created_at?: string | null
          email?: string | null
          first_name: string
          id?: string
          identification: string
          join_date?: string | null
          last_name: string
          member_code: string
          organization_id?: string | null
          phone?: string | null
          state?: string | null
          status?: Database["public"]["Enums"]["member_status"] | null
          updated_at?: string | null
        }
        Update: {
          address?: string | null
          birth_date?: string | null
          city?: string | null
          country?: string | null
          created_at?: string | null
          email?: string | null
          first_name?: string
          id?: string
          identification?: string
          join_date?: string | null
          last_name?: string
          member_code?: string
          organization_id?: string | null
          phone?: string | null
          state?: string | null
          status?: Database["public"]["Enums"]["member_status"] | null
          updated_at?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "members_organization_id_fkey"
            columns: ["organization_id"]
            isOneToOne: false
            referencedRelation: "organizations"
            referencedColumns: ["id"]
          },
        ]
      }
      organizations: {
        Row: {
          address: string | null
          created_at: string | null
          description: string | null
          email: string | null
          id: string
          name: string
          phone: string | null
          updated_at: string | null
        }
        Insert: {
          address?: string | null
          created_at?: string | null
          description?: string | null
          email?: string | null
          id?: string
          name: string
          phone?: string | null
          updated_at?: string | null
        }
        Update: {
          address?: string | null
          created_at?: string | null
          description?: string | null
          email?: string | null
          id?: string
          name?: string
          phone?: string | null
          updated_at?: string | null
        }
        Relationships: []
      }
      savings_accounts: {
        Row: {
          account_number: string
          balance: number | null
          created_at: string | null
          end_date: string | null
          id: string
          is_active: boolean | null
          member_id: string | null
          monthly_contribution: number | null
          savings_type: Database["public"]["Enums"]["savings_type"]
          start_date: string | null
          target_amount: number | null
          updated_at: string | null
        }
        Insert: {
          account_number: string
          balance?: number | null
          created_at?: string | null
          end_date?: string | null
          id?: string
          is_active?: boolean | null
          member_id?: string | null
          monthly_contribution?: number | null
          savings_type: Database["public"]["Enums"]["savings_type"]
          start_date?: string | null
          target_amount?: number | null
          updated_at?: string | null
        }
        Update: {
          account_number?: string
          balance?: number | null
          created_at?: string | null
          end_date?: string | null
          id?: string
          is_active?: boolean | null
          member_id?: string | null
          monthly_contribution?: number | null
          savings_type?: Database["public"]["Enums"]["savings_type"]
          start_date?: string | null
          target_amount?: number | null
          updated_at?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "savings_accounts_member_id_fkey"
            columns: ["member_id"]
            isOneToOne: false
            referencedRelation: "members"
            referencedColumns: ["id"]
          },
        ]
      }
      transactions: {
        Row: {
          amount: number
          created_at: string | null
          description: string | null
          id: string
          loan_id: string | null
          member_id: string | null
          savings_account_id: string | null
          transaction_date: string | null
          transaction_type: string
        }
        Insert: {
          amount: number
          created_at?: string | null
          description?: string | null
          id?: string
          loan_id?: string | null
          member_id?: string | null
          savings_account_id?: string | null
          transaction_date?: string | null
          transaction_type: string
        }
        Update: {
          amount?: number
          created_at?: string | null
          description?: string | null
          id?: string
          loan_id?: string | null
          member_id?: string | null
          savings_account_id?: string | null
          transaction_date?: string | null
          transaction_type?: string
        }
        Relationships: [
          {
            foreignKeyName: "transactions_loan_id_fkey"
            columns: ["loan_id"]
            isOneToOne: false
            referencedRelation: "loans"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "transactions_member_id_fkey"
            columns: ["member_id"]
            isOneToOne: false
            referencedRelation: "members"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "transactions_savings_account_id_fkey"
            columns: ["savings_account_id"]
            isOneToOne: false
            referencedRelation: "savings_accounts"
            referencedColumns: ["id"]
          },
        ]
      }
    }
    Views: {
      [_ in never]: never
    }
    Functions: {
      calculate_monthly_payment: {
        Args: { principal: number; annual_rate: number; months: number }
        Returns: number
      }
    }
    Enums: {
      loan_status:
        | "Pendiente"
        | "En Revisión"
        | "Aprobado"
        | "Rechazado"
        | "Activo"
        | "Completado"
      loan_type:
        | "Préstamo Personal"
        | "Préstamo Comercial"
        | "Préstamo Vivienda"
        | "Préstamo Educativo"
        | "Préstamo Emergencia"
      member_status: "Activo" | "Inactivo" | "Suspendido"
      savings_type:
        | "Ahorro Regular"
        | "Ahorro Programado"
        | "Ahorro Navideño"
        | "Ahorro Vacacional"
    }
    CompositeTypes: {
      [_ in never]: never
    }
  }
}

type DefaultSchema = Database[Extract<keyof Database, "public">]

export type Tables<
  DefaultSchemaTableNameOrOptions extends
    | keyof (DefaultSchema["Tables"] & DefaultSchema["Views"])
    | { schema: keyof Database },
  TableName extends DefaultSchemaTableNameOrOptions extends {
    schema: keyof Database
  }
    ? keyof (Database[DefaultSchemaTableNameOrOptions["schema"]]["Tables"] &
        Database[DefaultSchemaTableNameOrOptions["schema"]]["Views"])
    : never = never,
> = DefaultSchemaTableNameOrOptions extends { schema: keyof Database }
  ? (Database[DefaultSchemaTableNameOrOptions["schema"]]["Tables"] &
      Database[DefaultSchemaTableNameOrOptions["schema"]]["Views"])[TableName] extends {
      Row: infer R
    }
    ? R
    : never
  : DefaultSchemaTableNameOrOptions extends keyof (DefaultSchema["Tables"] &
        DefaultSchema["Views"])
    ? (DefaultSchema["Tables"] &
        DefaultSchema["Views"])[DefaultSchemaTableNameOrOptions] extends {
        Row: infer R
      }
      ? R
      : never
    : never

export type TablesInsert<
  DefaultSchemaTableNameOrOptions extends
    | keyof DefaultSchema["Tables"]
    | { schema: keyof Database },
  TableName extends DefaultSchemaTableNameOrOptions extends {
    schema: keyof Database
  }
    ? keyof Database[DefaultSchemaTableNameOrOptions["schema"]]["Tables"]
    : never = never,
> = DefaultSchemaTableNameOrOptions extends { schema: keyof Database }
  ? Database[DefaultSchemaTableNameOrOptions["schema"]]["Tables"][TableName] extends {
      Insert: infer I
    }
    ? I
    : never
  : DefaultSchemaTableNameOrOptions extends keyof DefaultSchema["Tables"]
    ? DefaultSchema["Tables"][DefaultSchemaTableNameOrOptions] extends {
        Insert: infer I
      }
      ? I
      : never
    : never

export type TablesUpdate<
  DefaultSchemaTableNameOrOptions extends
    | keyof DefaultSchema["Tables"]
    | { schema: keyof Database },
  TableName extends DefaultSchemaTableNameOrOptions extends {
    schema: keyof Database
  }
    ? keyof Database[DefaultSchemaTableNameOrOptions["schema"]]["Tables"]
    : never = never,
> = DefaultSchemaTableNameOrOptions extends { schema: keyof Database }
  ? Database[DefaultSchemaTableNameOrOptions["schema"]]["Tables"][TableName] extends {
      Update: infer U
    }
    ? U
    : never
  : DefaultSchemaTableNameOrOptions extends keyof DefaultSchema["Tables"]
    ? DefaultSchema["Tables"][DefaultSchemaTableNameOrOptions] extends {
        Update: infer U
      }
      ? U
      : never
    : never

export type Enums<
  DefaultSchemaEnumNameOrOptions extends
    | keyof DefaultSchema["Enums"]
    | { schema: keyof Database },
  EnumName extends DefaultSchemaEnumNameOrOptions extends {
    schema: keyof Database
  }
    ? keyof Database[DefaultSchemaEnumNameOrOptions["schema"]]["Enums"]
    : never = never,
> = DefaultSchemaEnumNameOrOptions extends { schema: keyof Database }
  ? Database[DefaultSchemaEnumNameOrOptions["schema"]]["Enums"][EnumName]
  : DefaultSchemaEnumNameOrOptions extends keyof DefaultSchema["Enums"]
    ? DefaultSchema["Enums"][DefaultSchemaEnumNameOrOptions]
    : never

export type CompositeTypes<
  PublicCompositeTypeNameOrOptions extends
    | keyof DefaultSchema["CompositeTypes"]
    | { schema: keyof Database },
  CompositeTypeName extends PublicCompositeTypeNameOrOptions extends {
    schema: keyof Database
  }
    ? keyof Database[PublicCompositeTypeNameOrOptions["schema"]]["CompositeTypes"]
    : never = never,
> = PublicCompositeTypeNameOrOptions extends { schema: keyof Database }
  ? Database[PublicCompositeTypeNameOrOptions["schema"]]["CompositeTypes"][CompositeTypeName]
  : PublicCompositeTypeNameOrOptions extends keyof DefaultSchema["CompositeTypes"]
    ? DefaultSchema["CompositeTypes"][PublicCompositeTypeNameOrOptions]
    : never

export const Constants = {
  public: {
    Enums: {
      loan_status: [
        "Pendiente",
        "En Revisión",
        "Aprobado",
        "Rechazado",
        "Activo",
        "Completado",
      ],
      loan_type: [
        "Préstamo Personal",
        "Préstamo Comercial",
        "Préstamo Vivienda",
        "Préstamo Educativo",
        "Préstamo Emergencia",
      ],
      member_status: ["Activo", "Inactivo", "Suspendido"],
      savings_type: [
        "Ahorro Regular",
        "Ahorro Programado",
        "Ahorro Navideño",
        "Ahorro Vacacional",
      ],
    },
  },
} as const
