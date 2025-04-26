SELECT 
    r.date AS day,
    s.first_name AS first_name,
    s.last_name AS last_name,
    s.hourly_rate AS hourly_rate,
    shift.start_time AS start_time,
    shift.end_time AS end_time,
    ROUND(TIMESTAMPDIFF(MINUTE, shift.start_time, shift.end_time) / 60, 2) AS shift_hours,
-- Ideally is to use MINUTE instead on an hour since hour will be rounded
    ROUND((TIMESTAMPDIFF(MINUTE, shift.start_time, shift.end_time) / 60) * s.hourly_rate, 2) AS staff_cost
FROM rota r
LEFT JOIN staff s ON r.staff_id = s.staff_id
LEFT JOIN shift ON shift.shift_id = r.shift_id;
