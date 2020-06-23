package
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.MouseEvent;
	
	public class Main extends Sprite
	{
		public function Main()
		{
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;

			var checkButton:CustomButton = new CustomButton("Check Licence");
			checkButton.x = checkButton.y = 40;
			checkButton.addEventListener(MouseEvent.CLICK, checkButton_clickHandler);
			this.addChild(checkButton);
		}

		protected function checkButton_clickHandler(event:MouseEvent):void
		{
			trace(123);
		}
	}
}