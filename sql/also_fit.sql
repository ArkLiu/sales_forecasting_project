/* Formatted on 10/9/2016 8:04:38 PM (QP5 v5.287) */
  SELECT DISTINCT
         mc.segment1 || mc.segment2 PL,
         msi.segment1 item_number,
         TO_CHAR (TO_DATE (msi.attribute3, 'MM/DD/RR'), 'RRRRMM') ac_month,
         DECODE (NVL (msi.attribute1, 'D'), 'A', 1, 0) rank_a,
         DECODE (NVL (msi.attribute1, 'D'), 'B', 1, 0) rank_b,
         DECODE (NVL (msi.attribute1, 'D'), 'C', 1, 0) rank_c,
         DECODE (NVL (msi.attribute1, 'D'), 'D', 1, 0) rank_d,
         DECODE (NVL (msi.attribute1, 'D'), 'N', 1, 0) rank_n,
         MIN (aces.year) also_fit_year_from,
         MAX (aces.year) also_fit_year_to,
         aces.make also_fit_make
    FROM mtl_system_items_b msi,
         mtl_item_categories mic,
         mtl_categories_b mc,
         xxgen_also_fit_aces aces
   WHERE     mic.inventory_item_id = msi.inventory_item_id
         AND mic.organization_id = msi.organization_id
         AND mc.category_id = mic.category_id
         AND mc.structure_id = 101
         AND aces.inventory_item_id = msi.inventory_item_id
         AND mc.segment1 != '40'
         AND mc.segment1 < '90'
GROUP BY mc.segment1 || mc.segment2,
         msi.segment1,
         TO_CHAR (TO_DATE (msi.attribute3, 'MM/DD/RR'), 'RRRRMM'),
         DECODE (NVL (msi.attribute1, 'D'), 'A', 1, 0),
         DECODE (NVL (msi.attribute1, 'D'), 'B', 1, 0),
         DECODE (NVL (msi.attribute1, 'D'), 'C', 1, 0),
         DECODE (NVL (msi.attribute1, 'D'), 'D', 1, 0),
         DECODE (NVL (msi.attribute1, 'D'), 'N', 1, 0),
         aces.make
ORDER BY mc.segment1 || mc.segment2 DESC,
         msi.segment1,
         MIN (aces.year),
         MAX (aces.year),
         aces.make
