<?xml version="1.0" encoding="utf-16"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ns0="http://despec.dk/pim/schemas/v1.0/inriver-import">
  <xsl:template match="BMECAT">
    <xsl:variable name="documentType" select="'Item'" />
    <xsl:variable name="identifyingField" select="'ItemID'" />
    <ns0:inRiverData>
      <ns0:Entities>
        <ns0:Entity>
          <ns0:Type>
            <xsl:value-of select="$documentType" />
          </ns0:Type>
          <ns0:IdentifyingField>
            <xsl:value-of select="$identifyingField" />
          </ns0:IdentifyingField>
        </ns0:Entity>
      </ns0:Entities>
    </ns0:inRiverData>
  </xsl:template>
</xsl:stylesheet>