
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Users, CreditCard, PiggyBank, Building2, TrendingUp, DollarSign } from "lucide-react";
import { useState, useEffect } from "react";
import { MemberManagement } from "@/components/MemberManagement";
import { LoanManagement } from "@/components/LoanManagement";
import { SavingsManagement } from "@/components/SavingsManagement";
import { supabase } from "@/integrations/supabase/client";
import { useToast } from "@/hooks/use-toast";

interface DashboardStats {
  totalMembers: number;
  totalLoans: string;
  totalSavings: string;
  totalOrganizations: number;
}

interface RecentActivity {
  id: string;
  member_name: string;
  type: string;
  amount: string;
  status: string;
}

const Index = () => {
  const [activeSection, setActiveSection] = useState('dashboard');
  const [stats, setStats] = useState<DashboardStats>({
    totalMembers: 0,
    totalLoans: "$0",
    totalSavings: "$0",
    totalOrganizations: 0
  });
  const [recentActivity, setRecentActivity] = useState<RecentActivity[]>([]);
  const [loading, setLoading] = useState(true);
  const { toast } = useToast();

  useEffect(() => {
    fetchDashboardData();
  }, []);

  const fetchDashboardData = async () => {
    try {
      setLoading(true);

      // Fetch total members
      const { count: membersCount } = await supabase
        .from('members')
        .select('*', { count: 'exact', head: true });

      // Fetch total organizations
      const { count: orgsCount } = await supabase
        .from('organizations')
        .select('*', { count: 'exact', head: true });

      // Fetch total loans amount
      const { data: loansData } = await supabase
        .from('loans')
        .select('amount')
        .eq('status', 'Activo');

      const totalLoansAmount = loansData?.reduce((sum, loan) => sum + parseFloat(loan.amount), 0) || 0;

      // Fetch total savings balance
      const { data: savingsData } = await supabase
        .from('savings_accounts')
        .select('balance')
        .eq('is_active', true);

      const totalSavingsAmount = savingsData?.reduce((sum, account) => sum + parseFloat(account.balance), 0) || 0;

      // Fetch recent loan applications
      const { data: recentLoans } = await supabase
        .from('loans')
        .select(`
          id,
          loan_type,
          amount,
          status,
          members (first_name, last_name)
        `)
        .order('created_at', { ascending: false })
        .limit(4);

      const formattedActivity = recentLoans?.map(loan => ({
        id: loan.id,
        member_name: `${loan.members?.first_name} ${loan.members?.last_name}`,
        type: loan.loan_type,
        amount: `$${parseFloat(loan.amount).toLocaleString()}`,
        status: loan.status
      })) || [];

      setStats({
        totalMembers: membersCount || 0,
        totalLoans: `$${totalLoansAmount.toLocaleString()}`,
        totalSavings: `$${totalSavingsAmount.toLocaleString()}`,
        totalOrganizations: orgsCount || 0
      });

      setRecentActivity(formattedActivity);
    } catch (error) {
      console.error('Error fetching dashboard data:', error);
      toast({
        title: "Error",
        description: "No se pudieron cargar los datos del dashboard",
        variant: "destructive"
      });
    } finally {
      setLoading(false);
    }
  };

  const renderContent = () => {
    switch (activeSection) {
      case 'members':
        return <MemberManagement />;
      case 'loans':
        return <LoanManagement />;
      case 'savings':
        return <SavingsManagement />;
      default:
        return (
          <div className="space-y-6">
            {/* Stats Grid */}
            <div className="grid gap-4 md:grid-cols-2 lg:grid-cols-4">
              <Card className="hover:shadow-lg transition-shadow">
                <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                  <CardTitle className="text-sm font-medium">
                    Total Miembros
                  </CardTitle>
                  <Users className="h-4 w-4 text-muted-foreground" />
                </CardHeader>
                <CardContent>
                  <div className="text-2xl font-bold">
                    {loading ? "..." : stats.totalMembers}
                  </div>
                  <p className="text-xs text-muted-foreground">
                    Asociados activos
                  </p>
                  <div className="flex items-center mt-2">
                    <TrendingUp className="h-3 w-3 text-green-500 mr-1" />
                    <span className="text-xs text-green-500">Creciendo</span>
                  </div>
                </CardContent>
              </Card>

              <Card className="hover:shadow-lg transition-shadow">
                <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                  <CardTitle className="text-sm font-medium">
                    Préstamos Activos
                  </CardTitle>
                  <CreditCard className="h-4 w-4 text-muted-foreground" />
                </CardHeader>
                <CardContent>
                  <div className="text-2xl font-bold">
                    {loading ? "..." : stats.totalLoans}
                  </div>
                  <p className="text-xs text-muted-foreground">
                    Total en préstamos
                  </p>
                  <div className="flex items-center mt-2">
                    <TrendingUp className="h-3 w-3 text-green-500 mr-1" />
                    <span className="text-xs text-green-500">+8% este mes</span>
                  </div>
                </CardContent>
              </Card>

              <Card className="hover:shadow-lg transition-shadow">
                <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                  <CardTitle className="text-sm font-medium">
                    Ahorros Totales
                  </CardTitle>
                  <PiggyBank className="h-4 w-4 text-muted-foreground" />
                </CardHeader>
                <CardContent>
                  <div className="text-2xl font-bold">
                    {loading ? "..." : stats.totalSavings}
                  </div>
                  <p className="text-xs text-muted-foreground">
                    Total en ahorros
                  </p>
                  <div className="flex items-center mt-2">
                    <TrendingUp className="h-3 w-3 text-green-500 mr-1" />
                    <span className="text-xs text-green-500">+15% este mes</span>
                  </div>
                </CardContent>
              </Card>

              <Card className="hover:shadow-lg transition-shadow">
                <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                  <CardTitle className="text-sm font-medium">
                    Organizaciones
                  </CardTitle>
                  <Building2 className="h-4 w-4 text-muted-foreground" />
                </CardHeader>
                <CardContent>
                  <div className="text-2xl font-bold">
                    {loading ? "..." : stats.totalOrganizations}
                  </div>
                  <p className="text-xs text-muted-foreground">
                    Organizaciones registradas
                  </p>
                  <div className="flex items-center mt-2">
                    <TrendingUp className="h-3 w-3 text-green-500 mr-1" />
                    <span className="text-xs text-green-500">+5% este mes</span>
                  </div>
                </CardContent>
              </Card>
            </div>

            {/* Recent Activity */}
            <div className="grid gap-4 md:grid-cols-2 lg:grid-cols-7">
              <Card className="col-span-4">
                <CardHeader>
                  <CardTitle>Solicitudes Recientes</CardTitle>
                  <CardDescription>
                    Últimas solicitudes de préstamos
                  </CardDescription>
                </CardHeader>
                <CardContent>
                  <div className="space-y-4">
                    {loading ? (
                      <div className="text-center py-4">Cargando...</div>
                    ) : recentActivity.length > 0 ? (
                      recentActivity.map((item) => (
                        <div key={item.id} className="flex items-center justify-between p-3 bg-gray-50 rounded-lg">
                          <div>
                            <p className="font-medium">{item.member_name}</p>
                            <p className="text-sm text-gray-600">{item.type}</p>
                          </div>
                          <div className="text-right">
                            <p className="font-semibold">{item.amount}</p>
                            <span className={`text-xs px-2 py-1 rounded-full ${
                              item.status === 'Aprobado' ? 'bg-green-100 text-green-800' :
                              item.status === 'Pendiente' ? 'bg-yellow-100 text-yellow-800' :
                              'bg-blue-100 text-blue-800'
                            }`}>
                              {item.status}
                            </span>
                          </div>
                        </div>
                      ))
                    ) : (
                      <div className="text-center py-4 text-gray-500">
                        No hay solicitudes recientes
                      </div>
                    )}
                  </div>
                </CardContent>
              </Card>

              <Card className="col-span-3">
                <CardHeader>
                  <CardTitle>Acciones Rápidas</CardTitle>
                  <CardDescription>
                    Operaciones frecuentes
                  </CardDescription>
                </CardHeader>
                <CardContent className="space-y-3">
                  <Button 
                    className="w-full justify-start"
                    onClick={() => setActiveSection('members')}
                  >
                    <Users className="mr-2 h-4 w-4" />
                    Nuevo Miembro
                  </Button>
                  <Button 
                    className="w-full justify-start"
                    variant="outline"
                    onClick={() => setActiveSection('loans')}
                  >
                    <CreditCard className="mr-2 h-4 w-4" />
                    Solicitud de Préstamo
                  </Button>
                  <Button 
                    className="w-full justify-start"
                    variant="outline"
                    onClick={() => setActiveSection('savings')}
                  >
                    <PiggyBank className="mr-2 h-4 w-4" />
                    Plan de Ahorro
                  </Button>
                  <Button 
                    className="w-full justify-start"
                    variant="outline"
                  >
                    <DollarSign className="mr-2 h-4 w-4" />
                    Registrar Pago
                  </Button>
                </CardContent>
              </Card>
            </div>
          </div>
        );
    }
  };

  return (
    <div className="min-h-screen bg-gray-50">
      {/* Header */}
      <header className="bg-white shadow-sm border-b">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="flex justify-between items-center py-6">
            <div>
              <h1 className="text-3xl font-bold text-gray-900">Manos Solidarias</h1>
              <p className="text-gray-600">Sistema de Gestión Cooperativa</p>
            </div>
            <div className="flex items-center space-x-4">
              <Button variant="outline">
                <Users className="mr-2 h-4 w-4" />
                Mi Perfil
              </Button>
            </div>
          </div>
        </div>
      </header>

      {/* Navigation */}
      <nav className="bg-white shadow-sm">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="flex space-x-8">
            {[
              { id: 'dashboard', name: 'Dashboard', icon: TrendingUp },
              { id: 'members', name: 'Miembros', icon: Users },
              { id: 'loans', name: 'Préstamos', icon: CreditCard },
              { id: 'savings', name: 'Ahorros', icon: PiggyBank }
            ].map((item) => {
              const Icon = item.icon;
              return (
                <button
                  key={item.id}
                  onClick={() => setActiveSection(item.id)}
                  className={`flex items-center px-3 py-4 text-sm font-medium border-b-2 transition-colors ${
                    activeSection === item.id
                      ? 'border-blue-500 text-blue-600'
                      : 'border-transparent text-gray-500 hover:text-gray-700 hover:border-gray-300'
                  }`}
                >
                  <Icon className="mr-2 h-4 w-4" />
                  {item.name}
                </button>
              );
            })}
          </div>
        </div>
      </nav>

      {/* Main Content */}
      <main className="max-w-7xl mx-auto py-6 sm:px-6 lg:px-8">
        <div className="px-4 py-6 sm:px-0">
          {renderContent()}
        </div>
      </main>
    </div>
  );
};

export default Index;
