SELECT
    D.fv_divname AS Nama_Divisi,
    MONTH(P.fd_tgljual) AS Bulan,
    SUM(P.fn_totalhargabruto) AS Total_Rp_Penjualan
FROM
    t_penjualanmst P
JOIN
    division_tb D ON P.fn_divid = D.fn_divid
WHERE
    P.fd_tgljual BETWEEN '2023-01-01' AND '2023-10-31'
GROUP BY
    D.fv_divname, Bulan
ORDER BY
    D.fv_divname, Bulan;
