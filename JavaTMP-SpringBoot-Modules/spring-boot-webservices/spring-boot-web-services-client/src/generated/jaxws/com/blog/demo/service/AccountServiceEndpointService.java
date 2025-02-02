
package com.blog.demo.service;

import java.net.URL;
import javax.xml.namespace.QName;
import jakarta.xml.ws.Service;
import jakarta.xml.ws.WebEndpoint;
import jakarta.xml.ws.WebServiceClient;
import jakarta.xml.ws.WebServiceException;
import jakarta.xml.ws.WebServiceFeature;


/**
 * This class was generated by the JAX-WS RI.
 * JAX-WS RI 3.0.0
 * Generated source version: 3.0
 * 
 */
@WebServiceClient(name = "AccountServiceEndpointService", targetNamespace = "http://service.demo.blog.com/", wsdlLocation = "classpath:META-INF\\wsdl\\accounts.wsdl")
public class AccountServiceEndpointService
    extends Service
{

    private static final URL ACCOUNTSERVICEENDPOINTSERVICE_WSDL_LOCATION;
    private static final WebServiceException ACCOUNTSERVICEENDPOINTSERVICE_EXCEPTION;
    private static final QName ACCOUNTSERVICEENDPOINTSERVICE_QNAME = new QName("http://service.demo.blog.com/", "AccountServiceEndpointService");

    static {
        ACCOUNTSERVICEENDPOINTSERVICE_WSDL_LOCATION = com.blog.demo.service.AccountServiceEndpointService.class.getResource("classpath:META-INF\\wsdl\\accounts.wsdl");
        WebServiceException e = null;
        if (ACCOUNTSERVICEENDPOINTSERVICE_WSDL_LOCATION == null) {
            e = new WebServiceException("Cannot find 'classpath:META-INF\\\\wsdl\\\\accounts.wsdl' wsdl. Place the resource correctly in the classpath.");
        }
        ACCOUNTSERVICEENDPOINTSERVICE_EXCEPTION = e;
    }

    public AccountServiceEndpointService() {
        super(__getWsdlLocation(), ACCOUNTSERVICEENDPOINTSERVICE_QNAME);
    }

    public AccountServiceEndpointService(WebServiceFeature... features) {
        super(__getWsdlLocation(), ACCOUNTSERVICEENDPOINTSERVICE_QNAME, features);
    }

    public AccountServiceEndpointService(URL wsdlLocation) {
        super(wsdlLocation, ACCOUNTSERVICEENDPOINTSERVICE_QNAME);
    }

    public AccountServiceEndpointService(URL wsdlLocation, WebServiceFeature... features) {
        super(wsdlLocation, ACCOUNTSERVICEENDPOINTSERVICE_QNAME, features);
    }

    public AccountServiceEndpointService(URL wsdlLocation, QName serviceName) {
        super(wsdlLocation, serviceName);
    }

    public AccountServiceEndpointService(URL wsdlLocation, QName serviceName, WebServiceFeature... features) {
        super(wsdlLocation, serviceName, features);
    }

    /**
     * 
     * @return
     *     returns AccountService
     */
    @WebEndpoint(name = "AccountServiceEndpointPort")
    public AccountService getAccountServiceEndpointPort() {
        return super.getPort(new QName("http://service.demo.blog.com/", "AccountServiceEndpointPort"), AccountService.class);
    }

    /**
     * 
     * @param features
     *     A list of {@link jakarta.xml.ws.WebServiceFeature} to configure on the proxy.  Supported features not in the <code>features</code> parameter will have their default values.
     * @return
     *     returns AccountService
     */
    @WebEndpoint(name = "AccountServiceEndpointPort")
    public AccountService getAccountServiceEndpointPort(WebServiceFeature... features) {
        return super.getPort(new QName("http://service.demo.blog.com/", "AccountServiceEndpointPort"), AccountService.class, features);
    }

    private static URL __getWsdlLocation() {
        if (ACCOUNTSERVICEENDPOINTSERVICE_EXCEPTION!= null) {
            throw ACCOUNTSERVICEENDPOINTSERVICE_EXCEPTION;
        }
        return ACCOUNTSERVICEENDPOINTSERVICE_WSDL_LOCATION;
    }

}
