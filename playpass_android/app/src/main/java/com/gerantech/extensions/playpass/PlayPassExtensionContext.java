package com.gerantech.extensions.playpass;

import android.util.Log;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;

import java.util.HashMap;
import java.util.Map;

public class PlayPassExtensionContext extends FREContext
{
	@Override
	public void dispose() {
	}

	@Override
	public Map<String, FREFunction> getFunctions() {

		Log.w(PlayPassExtension.LOG_TAG, "Map function called");

		Map<String, FREFunction> functionMap = new HashMap<String, FREFunction>();
		functionMap.put("check", new LicenceCheckFunction());
		return functionMap;
	}
}