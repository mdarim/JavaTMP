
package com.blog.demo.webservices.accountservice;

import jakarta.xml.bind.annotation.XmlRegistry;


/**
 * This object contains factory methods for each 
 * Java content interface and Java element interface 
 * generated in the com.blog.demo.webservices.accountservice package. 
 * <p>An ObjectFactory allows you to programmatically 
 * construct new instances of the Java representation 
 * for XML content. The Java representation of XML 
 * content can consist of schema derived interfaces 
 * and classes representing the binding of schema 
 * type definitions, element declarations and model 
 * groups.  Factory methods for each of these are 
 * provided in this class.
 * 
 */
@XmlRegistry
public class ObjectFactory {


    /**
     * Create a new ObjectFactory that can be used to create new instances of schema derived classes for package: com.blog.demo.webservices.accountservice
     * 
     */
    public ObjectFactory() {
    }

    /**
     * Create an instance of {@link AccountDetailsRequest }
     * 
     * @return
     *     the new instance of {@link AccountDetailsRequest }
     */
    public AccountDetailsRequest createAccountDetailsRequest() {
        return new AccountDetailsRequest();
    }

    /**
     * Create an instance of {@link AccountDetailsResponse }
     * 
     * @return
     *     the new instance of {@link AccountDetailsResponse }
     */
    public AccountDetailsResponse createAccountDetailsResponse() {
        return new AccountDetailsResponse();
    }

    /**
     * Create an instance of {@link Account }
     * 
     * @return
     *     the new instance of {@link Account }
     */
    public Account createAccount() {
        return new Account();
    }

}
