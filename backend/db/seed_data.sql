INSERT INTO doctors (name, specialization, location) VALUES
-- Bangalore
('Dr. Mehta', 'Cardiologist', 'Bangalore'),
('Dr. Iyer', 'Cardiologist', 'Bangalore'),
('Dr. Kapoor', 'Dermatologist', 'Bangalore'),
('Dr. Nair', 'Orthopedic', 'Bangalore'),

-- Delhi
('Dr. Sharma', 'Cardiologist', 'Delhi'),
('Dr. Gupta', 'Dermatologist', 'Delhi'),
('Dr. Malhotra', 'Dermatologist', 'Delhi'),
('Dr. Verma', 'Orthopedic', 'Delhi'),

-- Hyderabad
('Dr. Rao', 'Cardiologist', 'Hyderabad'),
('Dr. Reddy', 'Dermatologist', 'Hyderabad'),
('Dr. Chandra', 'Orthopedic', 'Hyderabad'),
('Dr. Singh', 'Orthopedic', 'Hyderabad');


INSERT INTO slots (doctor_id, slot_date, start_time, end_time)
SELECT 
    d.doctor_id,
    dates.slot_date,
    times.start_time,
    times.end_time
FROM doctors d
CROSS JOIN (
    SELECT '2026-02-06' AS slot_date UNION ALL
    SELECT '2026-02-07' UNION ALL
    SELECT '2026-02-08' UNION ALL
    SELECT '2026-02-09' UNION ALL
    SELECT '2026-02-10' UNION ALL
    SELECT '2026-02-11' UNION ALL
    SELECT '2026-02-12' UNION ALL
    SELECT '2026-02-13' UNION ALL
    SELECT '2026-02-14' UNION ALL
    SELECT '2026-02-15'
) dates
CROSS JOIN (
    SELECT '09:00' AS start_time, '09:30' AS end_time UNION ALL
    SELECT '11:00', '11:30' UNION ALL
    SELECT '15:00', '15:30'
) times;


INSERT INTO appointments (doctor_id, user_name, slot_date, start_time, status) VALUES
-- Feb 6
(1, 'Amit Kumar', '2026-02-06', '09:00', 'CONFIRMED'),
(3, 'Riya Sharma', '2026-02-06', '11:00', 'CONFIRMED'),

-- Feb 7
(5, 'Rahul Verma', '2026-02-07', '09:00', 'CONFIRMED'),
(6, 'Neha Gupta', '2026-02-07', '15:00', 'CONFIRMED'),

-- Feb 8
(9, 'Arjun Reddy', '2026-02-08', '11:00', 'CONFIRMED'),

-- Feb 9
(2, 'Sneha Patel', '2026-02-09', '09:00', 'CONFIRMED'),
(7, 'Karan Singh', '2026-02-09', '15:00', 'CONFIRMED'),

-- Feb 10
(10, 'Pooja Nair', '2026-02-10', '11:00', 'CONFIRMED'),

-- Feb 12
(4, 'Vikram Joshi', '2026-02-12', '15:00', 'CONFIRMED'),

-- Feb 14
(8, 'Anjali Mehta', '2026-02-14', '09:00', 'CONFIRMED');

UPDATE slots s
JOIN appointments a
  ON s.doctor_id = a.doctor_id
 AND s.slot_date = a.slot_date
 AND s.start_time = a.start_time
SET s.is_available = FALSE;

ALTER TABLE slots
ADD CONSTRAINT unique_slot UNIQUE (doctor_id, slot_date, start_time);
