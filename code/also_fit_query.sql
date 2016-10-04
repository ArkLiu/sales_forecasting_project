/* Formatted on 10/4/2016 11:44:46 AM (QP5 v5.287) */
  SELECT DISTINCT msib.segment1 item_number,
                  DECODE (mc.segment1 || mc.segment2, '1011', 1, 0) PL_1011,
                  DECODE (mc.segment1 || mc.segment2, '1012', 1, 0) PL_1012,
                  DECODE (mc.segment1 || mc.segment2, '1013', 1, 0) PL_1013,
                  DECODE (NVL (msib.attribute1, 'D'), 'A', 1, 0) rank_a,
                  DECODE (NVL (msib.attribute1, 'D'), 'B', 1, 0) rank_b,
                  DECODE (NVL (msib.attribute1, 'D'), 'C', 1, 0) rank_c,
                  aces.make,
                  aces.year
    FROM mtl_system_items_b msib,
         mtl_item_categories mic,
         mtl_categories_b mc,
         xxgen_also_fit_aces aces
   WHERE     mic.inventory_item_id = msib.inventory_item_id
         AND mic.organization_id = msib.organization_id
         AND mc.category_id = mic.category_id
         AND mc.structure_id = 101
         AND aces.inventory_item_id = msib.inventory_item_id
         AND mc.segment1 != '40'
         AND mc.segment1 || mc.segment2 IN ('1011', '1012', '1013')
ORDER BY msib.segment1, aces.make, aces.year