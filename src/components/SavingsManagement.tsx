
import { useState } from "react";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Textarea } from "@/components/ui/textarea";
import { Badge } from "@/components/ui/badge";
import { Table, TableBody, TableCell, TableHead, TableHeader, TableRow } from "@/components/ui/table";
import { Search, Plus, PiggyBank, TrendingUp, Calendar } from "lucide-react";

export const SavingsManagement = () => {
  const [showForm, setShowForm] = useState(false);
  const [searchTerm, setSearchTerm] = useState("");

  const savings = [
    {
      id: "A001",
      memberCode: "MS-001",
      memberName: "María Elena González",
      type: "Ahorro Programado",
      currentBalance: "$12,500",
      monthlyContribution: "$500",
      startDate: "2023-06-15",
      status: "Activo",
      goal: "$20,000"
    },
    {
      id: "A002",
      memberCode: "MS-002",
      memberName: "Carlos Alberto Rodríguez", 
      type: "Ahorro Navideño",
      currentBalance: "$8,750",
      monthlyContribution: "$400",
      startDate: "2023-01-01",
      status: "Activo",
      goal: "$12,000"
    },
    {
      id: "A003",
      memberCode: "MS-003",
      memberName: "Ana Sofía López",
      type: "Ahorro Libre",
      currentBalance: "$5,200",
      monthlyContribution: "Variable",
      startDate: "2023-03-20",
      status: "Activo",
      goal: "N/A"
    }
  ];

  const savingsTypes = [
    "Ahorro Programado",
    "Ahorro Navideño",
    "Ahorro Libre",
    "Ahorro Infantil",
    "Ahorro Vacacional"
  ];

  const filteredSavings = savings.filter(saving =>
    saving.memberName.toLowerCase().includes(searchTerm.toLowerCase()) ||
    saving.memberCode.toLowerCase().includes(searchTerm.toLowerCase()) ||
    saving.id.toLowerCase().includes(searchTerm.toLowerCase())
  );

  if (showForm) {
    return (
      <div className="space-y-6">
        <div className="flex items-center justify-between">
          <div>
            <h2 className="text-2xl font-bold">Nuevo Plan de Ahorro</h2>
            <p className="text-gray-600">Crear plan de ahorro para miembro</p>
          </div>
          <Button variant="outline" onClick={() => setShowForm(false)}>
            Volver a Lista
          </Button>
        </div>

        <Card>
          <CardHeader>
            <CardTitle>Información del Plan de Ahorro</CardTitle>
            <CardDescription>Configure el plan de ahorro</CardDescription>
          </CardHeader>
          <CardContent className="space-y-6">
            <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
              <div className="space-y-2">
                <Label htmlFor="memberCode">Código del Miembro</Label>
                <Input id="memberCode" placeholder="MS-001" />
              </div>
              <div className="space-y-2">
                <Label htmlFor="savingsType">Tipo de Ahorro</Label>
                <select className="w-full p-2 border rounded-md">
                  <option value="">Seleccionar tipo</option>
                  {savingsTypes.map(type => (
                    <option key={type} value={type}>{type}</option>
                  ))}
                </select>
              </div>
              <div className="space-y-2">
                <Label htmlFor="monthlyAmount">Monto Mensual</Label>
                <Input id="monthlyAmount" type="number" placeholder="500" />
              </div>
              <div className="space-y-2">
                <Label htmlFor="goalAmount">Meta de Ahorro (Opcional)</Label>
                <Input id="goalAmount" type="number" placeholder="20000" />
              </div>
              <div className="space-y-2">
                <Label htmlFor="startDate">Fecha de Inicio</Label>
                <Input id="startDate" type="date" />
              </div>
              <div className="space-y-2">
                <Label htmlFor="payrollDeduction">Quincena de Descuento</Label>
                <select className="w-full p-2 border rounded-md">
                  <option value="1">Primera Quincena</option>
                  <option value="2">Segunda Quincena</option>
                  <option value="0">Ambas Quincenas</option>
                </select>
              </div>
            </div>

            <div className="space-y-2">
              <Label htmlFor="purpose">Propósito del Ahorro</Label>
              <Textarea id="purpose" placeholder="Describa el propósito del ahorro..." />
            </div>

            <div className="flex justify-end space-x-4">
              <Button variant="outline" onClick={() => setShowForm(false)}>
                Cancelar
              </Button>
              <Button>
                Crear Plan
              </Button>
            </div>
          </CardContent>
        </Card>
      </div>
    );
  }

  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between">
        <div>
          <h2 className="text-2xl font-bold">Gestión de Ahorros</h2>
          <p className="text-gray-600">Administra los planes de ahorro de los miembros</p>
        </div>
        <Button onClick={() => setShowForm(true)}>
          <Plus className="mr-2 h-4 w-4" />
          Nuevo Plan
        </Button>
      </div>

      {/* Stats Cards */}
      <div className="grid gap-4 md:grid-cols-3">
        <Card>
          <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
            <CardTitle className="text-sm font-medium">Total Ahorros</CardTitle>
            <PiggyBank className="h-4 w-4 text-muted-foreground" />
          </CardHeader>
          <CardContent>
            <div className="text-2xl font-bold">$3,892,456</div>
            <p className="text-xs text-muted-foreground">847 cuentas de ahorro</p>
          </CardContent>
        </Card>
        <Card>
          <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
            <CardTitle className="text-sm font-medium">Aportaciones del Mes</CardTitle>
            <TrendingUp className="h-4 w-4 text-muted-foreground" />
          </CardHeader>
          <CardContent>
            <div className="text-2xl font-bold">$156,789</div>
            <p className="text-xs text-muted-foreground">+15% vs mes anterior</p>
          </CardContent>
        </Card>
        <Card>
          <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
            <CardTitle className="text-sm font-medium">Planes Activos</CardTitle>
            <Calendar className="h-4 w-4 text-muted-foreground" />
          </CardHeader>
          <CardContent>
            <div className="text-2xl font-bold">412</div>
            <p className="text-xs text-muted-foreground">Planes de ahorro vigentes</p>
          </CardContent>
        </Card>
      </div>

      {/* Search */}
      <Card>
        <CardContent className="p-6">
          <div className="flex items-center space-x-4">
            <div className="flex-1">
              <div className="relative">
                <Search className="absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400 h-4 w-4" />
                <Input
                  placeholder="Buscar por miembro, código o ID de ahorro..."
                  value={searchTerm}
                  onChange={(e) => setSearchTerm(e.target.value)}
                  className="pl-10"
                />
              </div>
            </div>
            <Button variant="outline">
              Filtros
            </Button>
          </div>
        </CardContent>
      </Card>

      {/* Savings Table */}
      <Card>
        <CardHeader>
          <CardTitle>Planes de Ahorro</CardTitle>
          <CardDescription>
            {filteredSavings.length} planes encontrados
          </CardDescription>
        </CardHeader>
        <CardContent>
          <Table>
            <TableHeader>
              <TableRow>
                <TableHead>ID</TableHead>
                <TableHead>Miembro</TableHead>
                <TableHead>Tipo</TableHead>
                <TableHead>Saldo Actual</TableHead>
                <TableHead>Aporte Mensual</TableHead>
                <TableHead>Meta</TableHead>
                <TableHead>Fecha Inicio</TableHead>
                <TableHead>Estado</TableHead>
                <TableHead>Acciones</TableHead>
              </TableRow>
            </TableHeader>
            <TableBody>
              {filteredSavings.map((saving) => (
                <TableRow key={saving.id}>
                  <TableCell className="font-medium">{saving.id}</TableCell>
                  <TableCell>
                    <div className="text-sm">
                      <div className="font-medium">{saving.memberName}</div>
                      <div className="text-gray-500">{saving.memberCode}</div>
                    </div>
                  </TableCell>
                  <TableCell>{saving.type}</TableCell>
                  <TableCell className="font-medium text-green-600">{saving.currentBalance}</TableCell>
                  <TableCell>{saving.monthlyContribution}</TableCell>
                  <TableCell>{saving.goal}</TableCell>
                  <TableCell>{saving.startDate}</TableCell>
                  <TableCell>
                    <Badge variant="default">
                      {saving.status}
                    </Badge>
                  </TableCell>
                  <TableCell>
                    <div className="flex space-x-2">
                      <Button size="sm" variant="outline">
                        Ver
                      </Button>
                      <Button size="sm" variant="outline">
                        Movimientos
                      </Button>
                    </div>
                  </TableCell>
                </TableRow>
              ))}
            </TableBody>
          </Table>
        </CardContent>
      </Card>
    </div>
  );
};
