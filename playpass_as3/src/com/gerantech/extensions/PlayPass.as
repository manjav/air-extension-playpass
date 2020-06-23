/**
 * Copyright (C) <year> <copyright holders>
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 **/
package com.gerantech.extensions
{
	import com.gerantech.extensions.events.PlayPassEvent;

	import flash.events.EventDispatcher;
	import flash.events.StatusEvent;
	import flash.external.ExtensionContext;
	import flash.system.Capabilities;
	
	/**
	 *  
	 * @author Mansour Djawadi
	 */	
		
	public class PlayPass extends EventDispatcher
	{
		//----------------------------------------
		//
		// Variables
		//
		//----------------------------------------
		private static var _instance:PlayPass;
		private var extContext:ExtensionContext;
		
		//----------------------------------------
		//
		// Properties
		//
		//----------------------------------------
		
		
		
		//----------------------------------------
		//
		// Public Methods
		//
		//----------------------------------------
		
		public static function get instance():PlayPass 
		{
			if ( !_instance )
				_instance = new PlayPass( new SingletonEnforcer() );
			
			return _instance;
		}

				
		/**
		 * Cleans up the instance of the native extension. 
		 */		
		public function dispose():void
		{ 
			if(!isAndroid)
				return;
			extContext.dispose(); 
		}

		
		//----------------------------------------
		//
		// Handlers
		//
		//----------------------------------------
		
		private function onStatus( event:StatusEvent ):void 
		{
			trace(event.code, event.level);
		}
		
		//----------------------------------------
		//
		// Constructor
		//
		//----------------------------------------

		/**
		 * Constructor. 
		 */		
		public function PlayPass( enforcer:SingletonEnforcer )
		{
			super();
			extContext = ExtensionContext.createExtensionContext( "com.gerantech.extensions.playpass", "" );
			
			if ( !extContext )
				throw new Error( "Android native extension is not supported on this platform." );
			extContext.addEventListener( StatusEvent.STATUS, onStatus );
		}
		
		
		private function get isAndroid():Boolean
		{
			var ret:Boolean = Capabilities.os.substr(0,5)=="Linux";
			if(!ret)
				this.dispatchEvent(new PlayPassEvent(PlayPassEvent.ERROR, "Not supported!"));
			return ret;
		}
	}
}

class SingletonEnforcer
{
}