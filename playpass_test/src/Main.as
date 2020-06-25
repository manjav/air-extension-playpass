package
{
	import com.gerantech.extensions.PlayPass;
	import com.gerantech.extensions.events.PlayPassEvent;

	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.events.Event;
	
	public class Main extends Sprite
	{
		private static const PUBLIC_KEY:String = "MIIBIjNBgkqhkiG9w0BAQEFAACAQ8AMIIBCgKCAQEAq3CeDvdkOkgjWQ9Pgrkkoa1mCZ+Z966r3B3+J6ckZGoZGYFlZEQRKwW2DrAjhb6KIXHGd5t8Ur3rp1NLugI/eSnm2xq542Nrv7b2Xt2wqanZoLcTSwTrv/8SU7PGuAgOk0LBQwQk2nClA0+TXAUaQHAuiTcacyTtwRNIXeMgwRJh8+p0oq0Ue0J0Egle2uQUr0Nb4JBFa5P8jbxXF2VfajSgPOsBpwK73LfFuZ5S+M8mNea7rRB3uZFCODzM4O+0URFQYTBZ25KgR7MEEoAqr+wnMt8uWqDt3k7Fb5l8oAFufiTspYap71Zlx0U7W9AaEDPCEJwX5AjueGNi7QIDAQAB";
		private var resultTextfield:TextField;

		public function Main()
		{
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			this.loaderInfo.addEventListener(Event.COMPLETE, this.loaderInfoCompleteHandler);

		}

		private function loaderInfoCompleteHandler(event:Event):void
		{
			this.loaderInfo.removeEventListener(Event.COMPLETE, this.loaderInfoCompleteHandler);
			var checkButton:CustomButton = new CustomButton("Check Licence");
			checkButton.x = checkButton.y = 40;
			checkButton.width = stage.stageWidth - 80;
			checkButton.addEventListener(MouseEvent.CLICK, checkButton_clickHandler);
			this.addChild(checkButton);

			resultTextfield = new TextField();
			resultTextfield.border = true;
			resultTextfield.x = 40;
			resultTextfield.y = 140;
			resultTextfield.width = stage.stageWidth - 80;
			this.addChild(resultTextfield);
		}

		protected function checkButton_clickHandler(event:MouseEvent):void
		{
			PlayPass.instance.checkLicence(PUBLIC_KEY);
			PlayPass.instance.addEventListener(PlayPassEvent.ALLOW, this.playpass_allowHandler);
			PlayPass.instance.addEventListener(PlayPassEvent.ERROR, this.playpass_errorHandler);
		}

		private function playpass_allowHandler(event:PlayPassEvent):void
		{
			PlayPass.instance.removeEventListener(PlayPassEvent.ALLOW, this.playpass_allowHandler);
			resultTextfield.text = event.data;
		}

		private function playpass_errorHandler(event:PlayPassEvent):void
		{	
			PlayPass.instance.removeEventListener(PlayPassEvent.ERROR, this.playpass_errorHandler);
			resultTextfield.text = event.toString();
		}
	}
}