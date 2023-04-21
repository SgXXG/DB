CREATE VIEW smartphone_details AS
SELECT s.smartphone_id, s.smartphone_type, s.smartphone_os, s.smartphone_release,
       sc.matrix, sc.diagonal, sc.resolution,
       sz.width, sz.height, sz.weight,
       d.material,
       c.black, c.white, c.gold, c.silver,
       b.apple, b.samsung, b.xiaomi, b.google,
       p.cores, p.capacity, p.frequency, p.model
FROM smartphone s
JOIN screen sc ON s.screen_id = sc.screen_id
JOIN size sz ON s.size_id = sz.size_id
JOIN design d ON s.design_id = d.design_id
JOIN brand b ON s.brand_id = b.brand_id
JOIN cpu p ON s.cpu_id = p.cpu_id
JOIN color c ON s.color_id = c.color_id;