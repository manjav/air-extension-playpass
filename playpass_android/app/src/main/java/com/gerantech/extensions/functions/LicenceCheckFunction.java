package com.gerantech.extensions.functions;

import android.app.Activity;
import android.util.Log;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;
import com.gerantech.extensions.PlayPassExtension;
import com.gerantech.extensions.PlayPassExtensionContext;

public class LicenceCheckFunction implements FREFunction
{
	@Override
	public FREObject call(FREContext context, FREObject[] args)
	{
		PlayPassExtensionContext divExtContext = (PlayPassExtensionContext) context;
		Activity a = divExtContext.getActivity();
//		TelephonyManager manager = (TelephonyManager) a.getSystemService(Context.TELEPHONY_SERVICE);
//        manager.listen(new CustomPhoneStateListener(a.getApplicationContext(), divExtContext), PhoneStateListener.LISTEN_CALL_STATE);
		Log.w(PlayPassExtension.LOG_TAG, "LicenceCheckFunction called.");

        return null;
	}
}