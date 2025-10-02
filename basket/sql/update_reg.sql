UPDATE
    registration
SET
    accompanying_employee_id = '$accompanying_employee_id',
    id_j = '$id_j',
    status = 'APPROVED'
WHERE
    id_r = '$id_r'