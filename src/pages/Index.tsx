
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Users, CreditCard, PiggyBank, Building2, TrendingUp, DollarSign } from "lucide-react";
import { useState } from "react";
import { MemberManagement } from "@/components/MemberManagement";
import { LoanManagement } from "@/components/LoanManagement";
import { SavingsManagement } from "@/components/SavingsManagement";

const Index = () => {
  const [activeSection, setActiveSection] = useState('dashboard');

  const stats = [
    {
      title: "Total Miembros",
      value: "1,247",
      description: "Asociados activos",
      icon: Users,
      trend: "+12% este mes"
    },
    {
      title: "Préstamos Activos",
      value: "$2,456,789",
      description: "Total en préstamos",
      icon: CreditCard,
      trend: "+8% este mes"
    },
    {
      title: "Ahorros Totales",
      value: "$3,892,456",
      description: "Total en ahorros",
      icon: PiggyBank,
      trend: "+15% este mes"
    },
    {
      title: "Organizaciones",
      value: "78",
      description: "Organizaciones registradas",
      icon: Building2,
      trend: "+5% este mes"
    }
  ];

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
              {stats.map((stat, index) => {
                const Icon = stat.icon;
                return (
                  <Card key={index} className="hover:shadow-lg transition-shadow">
                    <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                      <CardTitle className="text-sm font-medium">
                        {stat.title}
                      </CardTitle>
                      <Icon className="h-4 w-4 text-muted-foreground" />
                    </CardHeader>
                    <CardContent>
                      <div className="text-2xl font-bold">{stat.value}</div>
                      <p className="text-xs text-muted-foreground">
                        {stat.description}
                      </p>
                      <div className="flex items-center mt-2">
                        <TrendingUp className="h-3 w-3 text-green-500 mr-1" />
                        <span className="text-xs text-green-500">{stat.trend}</span>
                      </div>
                    </CardContent>
                  </Card>
                );
              })}
            </div>

            {/* Recent Activity */}
            <div className="grid gap-4 md:grid-cols-2 lg:grid-cols-7">
              <Card className="col-span-4">
                <CardHeader>
                  <CardTitle>Solicitudes Recientes</CardTitle>
                  <CardDescription>
                    Últimas solicitudes de préstamos y ahorros
                  </CardDescription>
                </CardHeader>
                <CardContent>
                  <div className="space-y-4">
                    {[
                      { name: "María González", type: "Préstamo Personal", amount: "$15,000", status: "Pendiente" },
                      { name: "Carlos Rodríguez", type: "Ahorro Programado", amount: "$5,000", status: "Aprobado" },
                      { name: "Ana López", type: "Préstamo Vivienda", amount: "$45,000", status: "En Revisión" },
                      { name: "José Martínez", type: "Ahorro Navideño", amount: "$2,500", status: "Aprobado" }
                    ].map((item, index) => (
                      <div key={index} className="flex items-center justify-between p-3 bg-gray-50 rounded-lg">
                        <div>
                          <p className="font-medium">{item.name}</p>
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
                    ))}
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
