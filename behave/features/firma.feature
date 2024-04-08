# features/firma.feature

#project name
@administracion_La_Rioja

#title report
@Firma_Report


#All test cases
@Post_firma

#Environment
@dev

#version
@tcs_0.0.1

Feature: Verify signing endpoint for PDF and XML files

    @tc_firma_de_documento_PDF
    Scenario: Firma de documento PDF
        Given I have the PDF file
        When I set the request body for PDF signing with alias "pruebas" and password "sabeurp"
        And I set the request headers as follows
            | Content-Type | application/json |
            | accept       | */*              |
        And I send a "POST" request to "http://localhost:8502/firma/serverSignature"
        Then the response status code should be 200
        #And The response must match the expected schema "firma_documento_pdf_schema"

    @tc_firma_de_documento_XML
    Scenario: Firma de documento XML
        Given I have the XML file
        When I set the request body for XML signing with alias "pruebas" and password "sabeurp"
        And I set the request headers as follows
            | Content-Type | application/json |
            | accept       | */*              |
        And I send a "POST" request to "http://localhost:8502/firma/serverSignature"
        Then the response status code should be 200
        #And the response must match the expected schema




