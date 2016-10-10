/* Formatted on 10/8/2016 10:22:19 PM (QP5 v5.287) */
  SELECT mc.segment1 || mc.segment2 pl,
         mp.organization_code ship_from,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'JAN2005', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            jan2005,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'FEB2005', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            feb2005,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'MAR2005', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            mar2005,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'APR2005', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            apr2005,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'MAY2005', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            may2005,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'JUN2005', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            jun2005,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'JUL2005', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            jul2005,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'AUG2005', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            aug2005,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'SEP2005', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            sep2005,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'OCT2005', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            oct2005,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'NOV2005', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            nov2005,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'DEC2005', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            dec2005,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'JAN2006', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            jan2006,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'FEB2006', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            feb2006,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'MAR2006', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            mar2006,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'APR2006', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            apr2006,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'MAY2006', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            may2006,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'JUN2006', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            jun2006,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'JUL2006', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            jul2006,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'AUG2006', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            aug2006,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'SEP2006', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            sep2006,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'OCT2006', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            oct2006,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'NOV2006', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            nov2006,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'DEC2006', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            dec2006,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'JAN2007', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            jan2007,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'FEB2007', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            feb2007,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'MAR2007', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            mar2007,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'APR2007', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            apr2007,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'MAY2007', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            may2007,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'JUN2007', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            jun2007,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'JUL2007', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            jul2007,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'AUG2007', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            aug2007,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'SEP2007', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            sep2007,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'OCT2007', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            oct2007,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'NOV2007', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            nov2007,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'DEC2007', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            dec2007,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'JAN2008', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            jan2008,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'FEB2008', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            feb2008,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'MAR2008', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            mar2008,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'APR2008', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            apr2008,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'MAY2008', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            may2008,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'JUN2008', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            jun2008,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'JUL2008', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            jul2008,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'AUG2008', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            aug2008,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'SEP2008', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            sep2008,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'OCT2008', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            oct2008,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'NOV2008', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            nov2008,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'DEC2008', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            dec2008,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'JAN2009', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            jan2009,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'FEB2009', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            feb2009,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'MAR2009', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            mar2009,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'APR2009', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            apr2009,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'MAY2009', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            may2009,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'JUN2009', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            jun2009,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'JUL2009', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            jul2009,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'AUG2009', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            aug2009,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'SEP2009', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            sep2009,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'OCT2009', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            oct2009,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'NOV2009', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            nov2009,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'DEC2009', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            dec2009,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'JAN2010', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            jan2010,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'FEB2010', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            feb2010,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'MAR2010', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            mar2010,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'APR2010', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            apr2010,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'MAY2010', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            may2010,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'JUN2010', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            jun2010,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'JUL2010', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            jul2010,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'AUG2010', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            aug2010,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'SEP2010', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            sep2010,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'OCT2010', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            oct2010,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'NOV2010', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            nov2010,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'DEC2010', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            dec2010,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'JAN2011', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            jan2011,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'FEB2011', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            feb2011,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'MAR2011', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            mar2011,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'APR2011', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            apr2011,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'MAY2011', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            may2011,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'JUN2011', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            jun2011,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'JUL2011', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            jul2011,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'AUG2011', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            aug2011,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'SEP2011', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            sep2011,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'OCT2011', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            oct2011,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'NOV2011', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            nov2011,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'DEC2011', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            dec2011,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'JAN2012', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            jan2012,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'FEB2012', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            feb2012,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'MAR2012', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            mar2012,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'APR2012', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            apr2012,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'MAY2012', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            may2012,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'JUN2012', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            jun2012,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'JUL2012', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            jul2012,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'AUG2012', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            aug2012,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'SEP2012', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            sep2012,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'OCT2012', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            oct2012,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'NOV2012', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            nov2012,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'DEC2012', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            dec2012,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'JAN2013', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            jan2013,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'FEB2013', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            feb2013,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'MAR2013', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            mar2013,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'APR2013', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            apr2013,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'MAY2013', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            may2013,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'JUN2013', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            jun2013,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'JUL2013', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            jul2013,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'AUG2013', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            aug2013,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'SEP2013', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            sep2013,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'OCT2013', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            oct2013,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'NOV2013', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            nov2013,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'DEC2013', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            dec2013,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'JAN2014', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            jan2014,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'FEB2014', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            feb2014,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'MAR2014', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            mar2014,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'APR2014', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            apr2014,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'MAY2014', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            may2014,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'JUN2014', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            jun2014,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'JUL2014', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            jul2014,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'AUG2014', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            aug2014,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'SEP2014', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            sep2014,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'OCT2014', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            oct2014,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'NOV2014', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            nov2014,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'DEC2014', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            dec2014,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'JAN2015', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            jan2015,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'FEB2015', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            feb2015,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'MAR2015', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            mar2015,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'APR2015', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            apr2015,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'MAY2015', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            may2015,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'JUN2015', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            jun2015,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'JUL2015', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            jul2015,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'AUG2015', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            aug2015,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'SEP2015', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            sep2015,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'OCT2015', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            oct2015,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'NOV2015', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            nov2015,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'DEC2015', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            dec2015,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'JAN2016', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            jan2016,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'FEB2016', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            feb2016,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'MAR2016', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            mar2016,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'APR2016', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            apr2016,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'MAY2016', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            may2016,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'JUN2016', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            jun2016,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'JUL2016', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            jul2016,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'AUG2016', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            aug2016,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'SEP2016', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            sep2016
    FROM oe_headers_all oh,
         xxgen_sales_order_hist_v xmsc,
         mtl_system_items_b msib,
         mtl_item_categories mic,
         mtl_categories_b mc,
         mtl_parameters mp,
         ra_customers rc
   WHERE     xmsc.header_id = oh.header_id
         AND msib.inventory_item_id = xmsc.inventory_item_id
         AND msib.organization_id = oh.ship_from_org_id
         AND mic.inventory_item_id = msib.inventory_item_id
         AND mic.organization_id = msib.organization_id
         AND mc.category_id = mic.category_id
         AND mc.structure_id = 101
         AND mp.organization_id = oh.ship_from_org_id
         AND rc.customer_id = oh.sold_to_org_id
         AND oh.creation_date >= TO_DATE ('01/01/2005', 'MM/DD/RRRR')
         AND oh.creation_date < TO_DATE ('10/01/2016', 'MM/DD/RRRR')
         AND oh.order_category_code = 'ORDER'
         AND NVL (oh.cancelled_flag, 'N') = 'N'
         AND NVL (oh.attribute8, 'XXX') <> 'Y'      -- exclude container order
         AND mc.segment1 < '90'
         AND rc.customer_number NOT LIKE 'Y%'
GROUP BY mc.segment1 || mc.segment2, msib.inventory_item_status_code
ORDER BY mc.segment1 || mc.segment2, mp.organization_code