package com.gerantech.extensions.listeners;

import android.content.Context;
import android.telephony.PhoneStateListener;

import com.adobe.fre.FREContext;

public class CustomPhoneStateListener extends PhoneStateListener 
{

    Context context; //Context to make Toast if required
	private FREContext extensionContext;
	
    public CustomPhoneStateListener(Context context, FREContext extensionContext)
    {
        super();
        this.context = context;
        this.extensionContext = extensionContext;
    }

    @Override
    public void onCallStateChanged(int state, String incomingNumber) 
    {
        super.onCallStateChanged(state, incomingNumber);
		extensionContext.dispatchStatusEventAsync("callStateChanged", String.valueOf( state ));
    }
}