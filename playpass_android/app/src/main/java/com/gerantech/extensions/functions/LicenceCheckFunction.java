package com.gerantech.extensions.functions;

import android.app.Activity;
import android.app.PendingIntent;
import android.content.IntentSender;
import android.util.Log;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;
import com.gerantech.extensions.PlayPassExtension;
import com.gerantech.extensions.PlayPassExtensionContext;
import com.google.licensingservicehelper.LicensingServiceCallback;
import com.google.licensingservicehelper.LicensingServiceHelper;

public class LicenceCheckFunction implements FREFunction
{
	private LicensingServiceHelper licensingServiceHelper;
	private PlayPassExtensionContext extensionContext;

	@Override
	public FREObject call(FREContext context, FREObject[] args)
	{
		extensionContext = (PlayPassExtensionContext) context;
		Activity acivity = extensionContext.getActivity();
		try {
			Log.w(PlayPassExtension.LOG_TAG, "LicenceCheckFunction called. " + args[0].getAsString());
			licensingServiceHelper = new LicensingServiceHelper(acivity, args[0].getAsString());
			licensingServiceHelper.checkLicense(new MyLicensingServiceCallback());
		} catch (Exception e) { e.printStackTrace(); }
		return null;
	}

//	@Override
//	protected void onDestroy() {
//		if (licensingServiceHelper != null) {
//			licensingServiceHelper.onDestroy();
//		}
//		super.onDestroy();
//	}

	private class MyLicensingServiceCallback implements LicensingServiceCallback {
		public void allow(String payloadJson) {
			extensionContext.dispatchStatusEventAsync("allow", payloadJson);
//			Log.w(PlayPassExtension.LOG_TAG, String.format("Allow access\nPayload: %s", payloadJson));
		}

		public void dontAllow(PendingIntent pendingIntent) {
//			Log.w(PlayPassExtension.LOG_TAG, "Don't allow access");

			try {
				extensionContext.dispatchStatusEventAsync("allow", "Don't allow access");
				licensingServiceHelper.showPaywall(pendingIntent);
//				MainActivity.this.finish();
			} catch (IntentSender.SendIntentException e) {
				extensionContext.dispatchStatusEventAsync("error", e.getMessage());
//				Log.e(PlayPassExtension.LOG_TAG, "Error launching paywall " + e.getMessage());
			}
		}

		public void applicationError(String errorMessage) {
			extensionContext.dispatchStatusEventAsync("error", errorMessage);
//			Log.w(PlayPassExtension.LOG_TAG, String.format("Application error: %s", errorMessage));
		}
	}
}