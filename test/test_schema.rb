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
                       date: '2017-01-01 12:34:56',
                       reason: 'Causa',
                       symptoms: 'Síntomas',
                       observations: 'Observaciones')

# Movimientos
mov1 = Movement.create(consult_id: cons1.id,
                       movement_type: 'Tipo 1')
mov2 = Movement.create(consult_id: cons1.id,
                       movement_type: 'Tipo 2')

cons1.movements << mov1
cons1.movements << mov2

# Métricas
metric1 = Metric.create(name: 'Métrica 1')
metric2 = Metric.create(name: 'Métrica 2')

# Mediciones
Measurement.create(metric_id: metric1.id,
                   value: 'Valor 1')
Measurement.create(metric_id: metric1.id,
                   value: 'Valor 2')
Measurement.create(metric_id: metric2.id,
                   value: 'Valor 1')
Measurement.create(metric_id: metric2.id,
                   value: 'Valor 2')

# Tokens de conexión
ConnectionToken.create(medical_center_id: mc1.id,
                       token: 'asdfghjkl1234567890',
                       expiration: '2017-11-05')
ConnectionToken.create(medical_center_id: mc1.id,
                       token: '1234567890asdfghjkl',
                       expiration: '2017-11-05')

# Accesos
ac1 = Access.create(access_type: 'Tipo 1')
ac2 = Access.create(access_type: 'Tipo 2')

# Permisos
per1 = Permission.create(patient_id: pat1.id,
                         professional_id: pro1.id,
                         date: '2017-11-02',
                         expiration: '2017-11-04')
per2 = Permission.create(patient_id: pat1.id,
                         professional_id: pro2.id,
                         date: '2017-11-03',
                         expiration: '2017-11-05')

per1.accesses << ac1
per2.accesses << ac1
per2.accesses << ac2