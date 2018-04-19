package com.emma.network.model;

import java.io.File;

import com.drew.lang.GeoLocation;

public class PhotoLocation {

	public GeoLocation location;
	public File file;

	public PhotoLocation(final GeoLocation location, final File file)
	{
		this.location = location;
		this.file = file;
	}

	public GeoLocation getLocation() {
		return location;
	}

	public void setLocation(GeoLocation location) {
		this.location = location;
	}

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}
	
	
}
