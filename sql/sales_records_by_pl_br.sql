/* Formatted on 10/8/2016 12:11:44 PM (QP5 v5.287) */
  SELECT mc.segment1 || mc.segment2 pl,
         mp.organization_code ship_from,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'JAN2005', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            jan2005_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'FEB2005', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            feb2005_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'MAR2005', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            mar2005_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'APR2005', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            apr2005_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'MAY2005', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            may2005_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'JUN2005', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            jun2005_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'JUL2005', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            jul2005_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'AUG2005', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            aug2005_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'SEP2005', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            sep2005_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'OCT2005', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            oct2005_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'NOV2005', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            nov2005_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'DEC2005', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            dec2005_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'JAN2006', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            jan2006_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'FEB2006', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            feb2006_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'MAR2006', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            mar2006_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'APR2006', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            apr2006_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'MAY2006', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            may2006_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'JUN2006', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            jun2006_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'JUL2006', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            jul2006_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'AUG2006', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            aug2006_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'SEP2006', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            sep2006_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'OCT2006', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            oct2006_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'NOV2006', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            nov2006_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'DEC2006', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            dec2006_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'JAN2007', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            jan2007_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'FEB2007', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            feb2007_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'MAR2007', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            mar2007_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'APR2007', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            apr2007_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'MAY2007', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            may2007_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'JUN2007', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            jun2007_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'JUL2007', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            jul2007_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'AUG2007', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            aug2007_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'SEP2007', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            sep2007_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'OCT2007', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            oct2007_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'NOV2007', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            nov2007_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'DEC2007', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            dec2007_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'JAN2008', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            jan2008_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'FEB2008', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            feb2008_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'MAR2008', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            mar2008_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'APR2008', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            apr2008_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'MAY2008', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            may2008_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'JUN2008', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            jun2008_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'JUL2008', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            jul2008_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'AUG2008', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            aug2008_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'SEP2008', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            sep2008_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'OCT2008', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            oct2008_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'NOV2008', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            nov2008_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'DEC2008', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            dec2008_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'JAN2009', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            jan2009_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'FEB2009', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            feb2009_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'MAR2009', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            mar2009_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'APR2009', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            apr2009_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'MAY2009', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            may2009_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'JUN2009', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            jun2009_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'JUL2009', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            jul2009_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'AUG2009', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            aug2009_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'SEP2009', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            sep2009_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'OCT2009', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            oct2009_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'NOV2009', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            nov2009_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'DEC2009', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            dec2009_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'JAN2010', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            jan2010_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'FEB2010', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            feb2010_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'MAR2010', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            mar2010_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'APR2010', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            apr2010_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'MAY2010', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            may2010_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'JUN2010', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            jun2010_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'JUL2010', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            jul2010_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'AUG2010', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            aug2010_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'SEP2010', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            sep2010_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'OCT2010', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            oct2010_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'NOV2010', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            nov2010_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'DEC2010', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            dec2010_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'JAN2011', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            jan2011_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'FEB2011', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            feb2011_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'MAR2011', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            mar2011_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'APR2011', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            apr2011_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'MAY2011', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            may2011_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'JUN2011', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            jun2011_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'JUL2011', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            jul2011_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'AUG2011', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            aug2011_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'SEP2011', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            sep2011_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'OCT2011', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            oct2011_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'NOV2011', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            nov2011_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'DEC2011', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            dec2011_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'JAN2012', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            jan2012_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'FEB2012', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            feb2012_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'MAR2012', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            mar2012_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'APR2012', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            apr2012_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'MAY2012', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            may2012_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'JUN2012', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            jun2012_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'JUL2012', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            jul2012_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'AUG2012', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            aug2012_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'SEP2012', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            sep2012_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'OCT2012', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            oct2012_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'NOV2012', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            nov2012_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'DEC2012', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            dec2012_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'JAN2013', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            jan2013_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'FEB2013', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            feb2013_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'MAR2013', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            mar2013_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'APR2013', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            apr2013_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'MAY2013', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            may2013_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'JUN2013', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            jun2013_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'JUL2013', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            jul2013_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'AUG2013', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            aug2013_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'SEP2013', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            sep2013_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'OCT2013', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            oct2013_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'NOV2013', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            nov2013_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'DEC2013', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            dec2013_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'JAN2014', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            jan2014_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'FEB2014', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            feb2014_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'MAR2014', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            mar2014_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'APR2014', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            apr2014_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'MAY2014', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            may2014_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'JUN2014', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            jun2014_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'JUL2014', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            jul2014_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'AUG2014', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            aug2014_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'SEP2014', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            sep2014_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'OCT2014', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            oct2014_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'NOV2014', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            nov2014_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'DEC2014', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            dec2014_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'JAN2015', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            jan2015_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'FEB2015', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            feb2015_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'MAR2015', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            mar2015_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'APR2015', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            apr2015_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'MAY2015', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            may2015_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'JUN2015', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            jun2015_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'JUL2015', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            jul2015_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'AUG2015', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            aug2015_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'SEP2015', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            sep2015_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'OCT2015', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            oct2015_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'NOV2015', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            nov2015_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'DEC2015', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            dec2015_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'JAN2016', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            jan2016_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'FEB2016', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            feb2016_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'MAR2016', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            mar2016_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'APR2016', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            apr2016_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'MAY2016', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            may2016_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'JUN2016', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            jun2016_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'JUL2016', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            jul2016_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'AUG2016', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            aug2016_order,
         SUM (
            DECODE (
               TO_CHAR (oh.ordered_date, 'MONYYYY'),
               'SEP2016', DECODE (oh.attribute10, NULL, xmsc.order_qty, 0),
               0))
            sep2016_order
    FROM oe_order_headers_all oh,
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
         AND oh.creation_date >= TO_DATE ('01/01/2010', 'MM/DD/RRRR')
         AND oh.creation_date < TO_DATE ('01/01/2016', 'MM/DD/RRRR')
         AND oh.order_category_code = 'ORDER'
         AND NVL (oh.cancelled_flag, 'N') = 'N'
         AND NVL (oh.attribute8, 'XXX') <> 'Y'      -- exclude container order
         AND mc.segment1 < '90'
         AND rc.customer_number NOT LIKE 'Y%'
GROUP BY mp.organization_code,
         mp.organization_id,
         mc.segment1 || mc.segment2,
         msib.segment1,
         msib.description,
         msib.inventory_item_status_code
ORDER BY mc.segment1 || mc.segment2, mp.organization_id