
import { useState } from "react";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Select } from "@/components/ui/select";
import { Textarea } from "@/components/ui/textarea";
import { Badge } from "@/components/ui/badge";
import { Table, TableBody, TableCell, TableHead, TableHeader, TableRow } from "@/components/ui/table";
import { Search, Plus, Edit, Eye, FileText } from "lucide-react";

export const MemberManagement = () => {
  const [showForm, setShowForm] = useState(false);
  const [searchTerm, setSearchTerm] = useState("");

  const members = [
    {
      id: "001",
      code: "MS-001",
      name: "María Elena González Pérez",
      identification: "1234567890",
      email: "maria.gonzalez@email.com",
      phone: "555-0123",
      status: "Activo",
      joinDate: "2023-01-15",
      savings: "$12,500",
      loans: "$8,000"
    },
    {
      id: "002", 
      code: "MS-002",
      name: "Carlos Alberto Rodríguez",
      identification: "0987654321",
      email: "carlos.rodriguez@email.com",
      phone: "555-0124",
      status: "Activo",
      joinDate: "2023-02-20",
      savings: "$8,750",
      loans: "$0"
    },
    {
      id: "003",
      code: "MS-003", 
      name: "Ana Sofía López Martínez",
      identification: "1122334455",
      email: "ana.lopez@email.com",
      phone: "555-0125",
      status: "Inactivo",
      joinDate: "2022-11-10",
      savings: "$5,200",
      loans: "$15,000"
    }
  ];

  const filteredMembers = members.filter(member =>
    member.name.toLowerCase().includes(searchTerm.toLowerCase()) ||
    member.code.toLowerCase().includes(searchTerm.toLowerCase()) ||
    member.identification.includes(searchTerm)
  );

  if (showForm) {
    return (
      <div className="space-y-6">
        <div className="flex items-center justify-between">
          <div>
            <h2 className="text-2xl font-bold">Nuevo Miembro</h2>
            <p className="text-gray-600">Registrar un nuevo asociado</p>
          </div>
          <Button variant="outline" onClick={() => setShowForm(false)}>
            Volver a Lista
          </Button>
        </div>

        <Card>
          <CardHeader>
            <CardTitle>Información Personal</CardTitle>
            <CardDescription>Datos básicos del nuevo miembro</CardDescription>
          </CardHeader>
          <CardContent className="space-y-6">
            <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
              <div className="space-y-2">
                <Label htmlFor="nombres">Nombres</Label>
                <Input id="nombres" placeholder="Nombres completos" />
              </div>
              <div className="space-y-2">
                <Label htmlFor="apellidos">Apellidos</Label>
                <Input id="apellidos" placeholder="Apellidos completos" />
              </div>
              <div className="space-y-2">
                <Label htmlFor="identificacion">Identificación</Label>
                <Input id="identificacion" placeholder="Número de identificación" />
              </div>
              <div className="space-y-2">
                <Label htmlFor="fechaNacimiento">Fecha de Nacimiento</Label>
                <Input id="fechaNacimiento" type="date" />
              </div>
              <div className="space-y-2">
                <Label htmlFor="email">Email</Label>
                <Input id="email" type="email" placeholder="correo@ejemplo.com" />
              </div>
              <div className="space-y-2">
                <Label htmlFor="telefono">Teléfono</Label>
                <Input id="telefono" placeholder="555-0123" />
              </div>
            </div>

            <div className="space-y-2">
              <Label htmlFor="direccion">Dirección</Label>
              <Textarea id="direccion" placeholder="Dirección completa de residencia" />
            </div>

            <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
              <div className="space-y-2">
                <Label htmlFor="pais">País</Label>
                <Input id="pais" defaultValue="Honduras" />
              </div>
              <div className="space-y-2">
                <Label htmlFor="departamento">Departamento</Label>
                <Input id="departamento" placeholder="Departamento" />
              </div>
              <div className="space-y-2">
                <Label htmlFor="municipio">Municipio</Label>
                <Input id="municipio" placeholder="Municipio" />
              </div>
            </div>

            <div className="flex justify-end space-x-4">
              <Button variant="outline" onClick={() => setShowForm(false)}>
                Cancelar
              </Button>
              <Button>
                Registrar Miembro
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
          <h2 className="text-2xl font-bold">Gestión de Miembros</h2>
          <p className="text-gray-600">Administra los asociados de la cooperativa</p>
        </div>
        <Button onClick={() => setShowForm(true)}>
          <Plus className="mr-2 h-4 w-4" />
          Nuevo Miembro
        </Button>
      </div>

      {/* Search and Filters */}
      <Card>
        <CardContent className="p-6">
          <div className="flex items-center space-x-4">
            <div className="flex-1">
              <div className="relative">
                <Search className="absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400 h-4 w-4" />
                <Input
                  placeholder="Buscar por nombre, código o identificación..."
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

      {/* Members Table */}
      <Card>
        <CardHeader>
          <CardTitle>Lista de Miembros</CardTitle>
          <CardDescription>
            {filteredMembers.length} miembros encontrados
          </CardDescription>
        </CardHeader>
        <CardContent>
          <Table>
            <TableHeader>
              <TableRow>
                <TableHead>Código</TableHead>
                <TableHead>Nombre Completo</TableHead>
                <TableHead>Identificación</TableHead>
                <TableHead>Contacto</TableHead>
                <TableHead>Estado</TableHead>
                <TableHead>Ahorros</TableHead>
                <TableHead>Préstamos</TableHead>
                <TableHead>Acciones</TableHead>
              </TableRow>
            </TableHeader>
            <TableBody>
              {filteredMembers.map((member) => (
                <TableRow key={member.id}>
                  <TableCell className="font-medium">{member.code}</TableCell>
                  <TableCell>{member.name}</TableCell>
                  <TableCell>{member.identification}</TableCell>
                  <TableCell>
                    <div className="text-sm">
                      <div>{member.email}</div>
                      <div className="text-gray-500">{member.phone}</div>
                    </div>
                  </TableCell>
                  <TableCell>
                    <Badge variant={member.status === 'Activo' ? 'default' : 'secondary'}>
                      {member.status}
                    </Badge>
                  </TableCell>
                  <TableCell className="text-green-600 font-medium">{member.savings}</TableCell>
                  <TableCell className="text-blue-600 font-medium">{member.loans}</TableCell>
                  <TableCell>
                    <div className="flex space-x-2">
                      <Button size="sm" variant="outline">
                        <Eye className="h-3 w-3" />
                      </Button>
                      <Button size="sm" variant="outline">
                        <Edit className="h-3 w-3" />
                      </Button>
                      <Button size="sm" variant="outline">
                        <FileText className="h-3 w-3" />
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
