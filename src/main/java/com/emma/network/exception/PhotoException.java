package com.emma.network.exception;

public class PhotoException extends Exception{

	private static final long serialVersionUID = 1L;

	public PhotoException(String message)
	    {
	        super("PhotoException-"+message);
	    }
	    
	    public PhotoException(String message, Throwable cause)
	    {
	        super("PhotoException-"+message,cause);
	    }

}
