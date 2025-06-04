
import { useState } from "react";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Textarea } from "@/components/ui/textarea";
import { Badge } from "@/components/ui/badge";
import { Table, TableBody, TableCell, TableHead, TableHeader, TableRow } from "@/components/ui/table";
import { Search, Plus, FileText, DollarSign, Calendar } from "lucide-react";

export const LoanManagement = () => {
  const [showForm, setShowForm] = useState(false);
  const [searchTerm, setSearchTerm] = useState("");

  const loans = [
    {
      id: "P001",
      memberCode: "MS-001",
      memberName: "María Elena González",
      type: "Préstamo Personal",
      amount: "$15,000",
      requestDate: "2024-01-15",
      status: "Aprobado",
      purpose: "Mejoras en el hogar",
      monthlyPayment: "$850"
    },
    {
      id: "P002",
      memberCode: "MS-002", 
      memberName: "Carlos Alberto Rodríguez",
      type: "Préstamo Comercial",
      amount: "$25,000",
      requestDate: "2024-01-20",
      status: "En Revisión",
      purpose: "Inversión en negocio",
      monthlyPayment: "$1,200"
    },
    {
      id: "P003",
      memberCode: "MS-003",
      memberName: "Ana Sofía López",
      type: "Préstamo Vivienda",
      amount: "$45,000",
      requestDate: "2024-01-25",
      status: "Pendiente",
      purpose: "Compra de vivienda",
      monthlyPayment: "$2,100"
    }
  ];

  const loanTypes = [
    "Préstamo Personal",
    "Préstamo Comercial", 
    "Préstamo Vivienda",
    "Préstamo Educativo",
    "Préstamo Emergencia"
  ];

  const filteredLoans = loans.filter(loan =>
    loan.memberName.toLowerCase().includes(searchTerm.toLowerCase()) ||
    loan.memberCode.toLowerCase().includes(searchTerm.toLowerCase()) ||
    loan.id.toLowerCase().includes(searchTerm.toLowerCase())
  );

  if (showForm) {
    return (
      <div className="space-y-6">
        <div className="flex items-center justify-between">
          <div>
            <h2 className="text-2xl font-bold">Nueva Solicitud de Préstamo</h2>
            <p className="text-gray-600">Registrar solicitud de préstamo</p>
          </div>
          <Button variant="outline" onClick={() => setShowForm(false)}>
            Volver a Lista
          </Button>
        </div>

        <Card>
          <CardHeader>
            <CardTitle>Información del Préstamo</CardTitle>
            <CardDescription>Complete los datos de la solicitud</CardDescription>
          </CardHeader>
          <CardContent className="space-y-6">
            <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
              <div className="space-y-2">
                <Label htmlFor="memberCode">Código del Miembro</Label>
                <Input id="memberCode" placeholder="MS-001" />
              </div>
              <div className="space-y-2">
                <Label htmlFor="loanType">Tipo de Préstamo</Label>
                <select className="w-full p-2 border rounded-md">
                  <option value="">Seleccionar tipo</option>
                  {loanTypes.map(type => (
                    <option key={type} value={type}>{type}</option>
                  ))}
                </select>
              </div>
              <div className="space-y-2">
                <Label htmlFor="amount">Monto Solicitado</Label>
                <Input id="amount" type="number" placeholder="15000" />
              </div>
              <div className="space-y-2">
                <Label htmlFor="term">Plazo (meses)</Label>
                <Input id="term" type="number" placeholder="24" />
              </div>
            </div>

            <div className="space-y-2">
              <Label htmlFor="purpose">Motivo del Préstamo</Label>
              <Textarea id="purpose" placeholder="Describa el propósito del préstamo..." />
            </div>

            <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
              <div className="space-y-2">
                <Label htmlFor="guarantor1">Fiador 1 (Opcional)</Label>
                <Input id="guarantor1" placeholder="Nombre del primer fiador" />
              </div>
              <div className="space-y-2">
                <Label htmlFor="guarantor2">Fiador 2 (Opcional)</Label>
                <Input id="guarantor2" placeholder="Nombre del segundo fiador" />
              </div>
            </div>

            <div className="flex justify-end space-x-4">
              <Button variant="outline" onClick={() => setShowForm(false)}>
                Cancelar
              </Button>
              <Button>
                Enviar Solicitud
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
          <h2 className="text-2xl font-bold">Gestión de Préstamos</h2>
          <p className="text-gray-600">Administra las solicitudes y préstamos activos</p>
        </div>
        <Button onClick={() => setShowForm(true)}>
          <Plus className="mr-2 h-4 w-4" />
          Nueva Solicitud
        </Button>
      </div>

      {/* Stats Cards */}
      <div className="grid gap-4 md:grid-cols-3">
        <Card>
          <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
            <CardTitle className="text-sm font-medium">Préstamos Activos</CardTitle>
            <DollarSign className="h-4 w-4 text-muted-foreground" />
          </CardHeader>
          <CardContent>
            <div className="text-2xl font-bold">$2,456,789</div>
            <p className="text-xs text-muted-foreground">127 préstamos activos</p>
          </CardContent>
        </Card>
        <Card>
          <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
            <CardTitle className="text-sm font-medium">Solicitudes Pendientes</CardTitle>
            <Calendar className="h-4 w-4 text-muted-foreground" />
          </CardHeader>
          <CardContent>
            <div className="text-2xl font-bold">23</div>
            <p className="text-xs text-muted-foreground">Esperando aprobación</p>
          </CardContent>
        </Card>
        <Card>
          <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
            <CardTitle className="text-sm font-medium">Tasa Promedio</CardTitle>
            <FileText className="h-4 w-4 text-muted-foreground" />
          </CardHeader>
          <CardContent>
            <div className="text-2xl font-bold">8.5%</div>
            <p className="text-xs text-muted-foreground">Tasa de interés anual</p>
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
                  placeholder="Buscar por miembro, código o ID de préstamo..."
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

      {/* Loans Table */}
      <Card>
        <CardHeader>
          <CardTitle>Solicitudes de Préstamo</CardTitle>
          <CardDescription>
            {filteredLoans.length} solicitudes encontradas
          </CardDescription>
        </CardHeader>
        <CardContent>
          <Table>
            <TableHeader>
              <TableRow>
                <TableHead>ID</TableHead>
                <TableHead>Miembro</TableHead>
                <TableHead>Tipo</TableHead>
                <TableHead>Monto</TableHead>
                <TableHead>Fecha</TableHead>
                <TableHead>Estado</TableHead>
                <TableHead>Cuota Mensual</TableHead>
                <TableHead>Acciones</TableHead>
              </TableRow>
            </TableHeader>
            <TableBody>
              {filteredLoans.map((loan) => (
                <TableRow key={loan.id}>
                  <TableCell className="font-medium">{loan.id}</TableCell>
                  <TableCell>
                    <div className="text-sm">
                      <div className="font-medium">{loan.memberName}</div>
                      <div className="text-gray-500">{loan.memberCode}</div>
                    </div>
                  </TableCell>
                  <TableCell>{loan.type}</TableCell>
                  <TableCell className="font-medium text-green-600">{loan.amount}</TableCell>
                  <TableCell>{loan.requestDate}</TableCell>
                  <TableCell>
                    <Badge variant={
                      loan.status === 'Aprobado' ? 'default' :
                      loan.status === 'En Revisión' ? 'secondary' : 
                      'outline'
                    }>
                      {loan.status}
                    </Badge>
                  </TableCell>
                  <TableCell className="font-medium">{loan.monthlyPayment}</TableCell>
                  <TableCell>
                    <div className="flex space-x-2">
                      <Button size="sm" variant="outline">
                        Ver
                      </Button>
                      <Button size="sm" variant="outline">
                        Editar
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
