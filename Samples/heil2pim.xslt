<?xml version="1.0" encoding="utf-16"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ns0="http://despec.dk/pim/schemas/v1.0/inriver-import">
  <xsl:template match="BMECAT">
    <xsl:variable name="documentType" select="'Item'" />
    <xsl:variable name="identifyingField" select="'ItemID'" />
    <ns0:inRiverData>
      <ns0:Entities>
        <xsl:for-each select="T_NEW_CATALOG/ARTICLE">
          <xsl:variable name="ItemAlcoholContent">
            <xsl:value-of select="ARTICLE_FEATURES/FEATURE[FNAME = 'Alcohol_percentage']/FVALUE" />
          </xsl:variable>
          <xsl:variable name="Description">
            <xsl:value-of select="ARTICLE_FEATURES/FEATURE[FNAME = 'Article_Description']/FVALUE" />
          </xsl:variable>
          <xsl:variable name="TaxStatus">
            <xsl:choose>
              <xsl:when test="ARTICLE_FEATURES/FEATURE[FNAME = 'Tax Status']/FVALUE">
                <xsl:value-of select="ARTICLE_FEATURES/FEATURE[FNAME = 'Tax Status']/FVALUE" />
              </xsl:when>
              <xsl:otherwise>
                <!--Hardcode or other value-of select -->
                <xsl:text>N/A</xsl:text>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:variable>
          <ns0:Entity>
            <ns0:Type>
              <xsl:value-of select="$documentType" />
            </ns0:Type>
            <ns0:IdentifyingField>
              <xsl:value-of select="$identifyingField" />
            </ns0:IdentifyingField>
            <ns0:Fields>
              <ns0:Field>
                <ns0:Name>ItemAlcoholContent</ns0:Name>
                <ns0:CVLKey>
                  <xsl:value-of select="$ItemAlcoholContent" />
                </ns0:CVLKey>
              </ns0:Field>
              <ns0:Field>
                <ns0:Name>Description</ns0:Name>
                <ns0:String>
                  <xsl:value-of select="$Description" />
                </ns0:String>
              </ns0:Field>
              <ns0:Field>
                <ns0:Name>TaxStatus</ns0:Name>
                <ns0:String>
                  <xsl:value-of select="$TaxStatus" />
                </ns0:String>
              </ns0:Field>
            </ns0:Fields>
          </ns0:Entity>
        </xsl:for-each>
      </ns0:Entities>
    </ns0:inRiverData>
  </xsl:template>
</xsl:stylesheet>