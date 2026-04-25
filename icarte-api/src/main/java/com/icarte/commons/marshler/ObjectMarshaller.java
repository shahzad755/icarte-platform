
package com.icarte.commons.marshler;

import java.util.List;

public interface ObjectMarshaller {

	String marshalObject(Object obj);
	String marshalList(List data);
}
