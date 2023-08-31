SELECT
    employee.id,
    employee.name,
    COUNT(sales.id) as sales_count,
    RANK() OVER (
        ORDER BY
            COUNT(sales.id) DESC
    ) as sales_rank_count,
    SUM(sales.price) as sales_sum,
    RANK() OVER (
        ORDER BY
            SUM(sales.price) DESC
    ) as sales_rank_sum
FROM
    employee
    JOIN sales ON sales.employee_id = employee.id
GROUP BY
    employee.id,
    employee.name
ORDER BY
    sales_sum DESC;