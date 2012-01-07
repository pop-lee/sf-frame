package cn.sftech.www.view
{
	import cn.sftech.www.event.SFInitializeEvent;
	
	import flash.display.Stage;
	import flash.errors.IllegalOperationError;
	import flash.events.Event;

	public class SFApplication extends SFContainer
	{
		private static var _application : Stage;
		
		private var _rotation : Boolean = false;
		
		public function SFApplication()
		{
			this.addEventListener(Event.ADDED_TO_STAGE,addToStageHandle);
			super();
		}
		
		protected function init() : void
		{
		}
		
		public static function get application() : Stage
		{
			return _application;
		}
		
		private function addToStageHandle(event : Event) : void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE,addToStageHandle);
			
			_application = stage;
//			this.backgroundAlpha = 0;
			if(_rotation) {
				this.width = stage.stageHeight;
				this.height = stage.stageWidth;
			} else {
				this.width = stage.stageWidth;
				this.height = stage.stageHeight;
			}
			init();
//			this.dispatchEvent(new BdcInitializeEvent());
		}
		
		override public function set rotation(value:Number):void
		{
			if(value == 90) {
				this.x = stage.stageWidth;
				this.y = 0;
			} else if(value == 270) {
				this.x = stage.stageWidth;
				this.y = stage.stageHeight;
			} else {
				throw new Error("旋转仅能为90度活270度");
			}
			super.rotation = value;
			_rotation = true;
			this.width = stage.stageHeight;
			this.height = stage.stageWidth;
		}
		
	}
}