# Centro médico
mc1 = MedicalCenter.create(name: 'Centro Médico',
                           address: 'Dirección')

# Especialidades
esp1 = Speciality.create(name: 'Especialidad 1')
esp2 = Speciality.create(name: 'Especialidad 2')

# Profesionales
pro1 = Professional.create(rut: '11.222.333-4',
                           name: 'Nombre 1',
                           last_name: 'Apellido 1',
                           age: 30,
                           nationality: 'Chilena',
                           job_title: 'Título 1',
                           grant_date: '2010-01-01',
                           granting_entity: 'Entidad 1',
                           speciality_id: esp1.id,
                           registration_number: '1234567890',
                           registration_date: '2010-01-02',
                           freelance: true,
                           email: 'mail@asd.cl',
                           phone: '12345678')
pro2 = Professional.create(rut: '11.333.444-5',
                           name: 'Nombre 2',
                           last_name: 'Apellido 2',
                           age: 30,
                           nationality: 'Chilena',
                           job_title: 'Título 2',
                           grant_date: '2010-01-01',
                           granting_entity: 'Entidad 1',
                           speciality_id: esp2.id,
                           registration_number: '1234567890',
                           registration_date: '2010-01-02',
                           freelance: true,
                           email: 'mail2@asd.cl')
# Asociar a centro médico
mc1.professionals << pro1
mc1.professionals << pro2

# Paciente
pat1 = Patient.create(rut: '12.345.678-9',
                      name: 'Nombre Paciente',
                      last_name: 'Apellido Paciente',
                      age: 20)

# Consulta
cons1 = Consult.create(patient_id: pat1.id,
                       professional_id: pro2.id,
                       date: '2017-01-01',
                       reason: 'Causa',
                       symptoms: 'Síntomas',
                       observations: 'Observaciones')

# Tipos de movimiento
type1 = MovementType.create(name: 'Movimiento 1')
type2 = MovementType.create(name: 'Movimiento 2')

# Movimientos
mov1 = Movement.create(consult_id: cons1.id,
                       movement_type_id: type1.id)
mov2 = Movement.create(consult_id: cons1.id,
                       movement_type_id: type2.id)

cons1.movements << mov1
cons1.movements << mov2