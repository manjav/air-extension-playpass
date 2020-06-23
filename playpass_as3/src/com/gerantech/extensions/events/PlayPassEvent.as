/**
 * Copyright (C) <year> <copyright holders>
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 **/
package com.gerantech.extensions.events
{
	import flash.events.Event;

	/**
	 * An event used by the native extension for
	 * events related to the volume controls.
	 *  
	 * @author Nathan Weber
	 */	
	public class PlayPassEvent extends Event
	{
		//----------------------------------------
		//
		// Constants
		//
		//----------------------------------------

		/**
		 * Allow or not allow event. 
		 */		

		public static const ERROR:String = "error";


		//----------------------------------------
		//
		// Variables
		//
		//----------------------------------------
		public var data:*;

		

		//----------------------------------------
		//
		// Constructor
		//
		//----------------------------------------

		/**
		 * Constructor.
		 *  
		 * @param type Event type.
		 * @param volume The system volume.
		 * @param bubbles Whether or not the event bubbles.
		 * @param cancelable Whether or not the event is cancelable.
		 */		
		public function PlayPassEvent( type:String, data:*,  bubbles:Boolean=false, cancelable:Boolean=false )
		{
			this.data = data;
			super(type, bubbles, cancelable);
		}
	}
}