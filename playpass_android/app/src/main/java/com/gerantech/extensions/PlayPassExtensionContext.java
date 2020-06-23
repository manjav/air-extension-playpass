package com.gerantech.extensions;

import android.util.Log;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.gerantech.extensions.functions.LicenceCheckFunction;

import java.util.HashMap;
import java.util.Map;

public class PlayPassExtensionContext extends FREContext //implements ActivityResultCallback, StateChangeCallback {
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