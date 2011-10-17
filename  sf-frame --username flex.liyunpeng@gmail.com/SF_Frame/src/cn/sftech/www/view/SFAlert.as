package cn.sftech.www.view
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.system.System;
	
	import flashx.textLayout.formats.TextAlign;

	public class SFAlert extends SFContainer
	{
		public static var background : Class;
		
		public static var okBtn : Class;
		
		private var _model : SFSprite = new SFSprite();
		
		private var _tf : SFTextField = new SFTextField();
		
		private var _leading : int = 10;
		
		public function SFAlert()
		{
			super();
			init();
		}
		
		private function init() : void
		{
			this.backgroundAlpha = 0;
			this.width = SFApplication.application.stageWidth;
			this.height = SFApplication.application.stageHeight;
			
			_model.percentWidth = 100;
			_model.percentHeight = 100;
			_model.backgroundAlpha = 0.5;
			_model.backgroundColor = 0xffffff;
//			
			addChild(_model);
//			
			_tf.text = " ";
			_tf.size = 15;
			addChild(_tf);
			
		}
		
		public static function show(value : String) : void
		{
			var alert : SFAlert = new SFAlert();
			var mc : MovieClip = new background();
			alert._tf.text = value;
			
			mc.width = alert._tf.width > SFApplication.application.stageWidth - alert._leading*2?
				SFApplication.application.stageWidth - alert._leading*2:alert._tf.width + alert._leading*2;
			
			alert._tf.width = mc.width - alert._leading*2;
			alert._tf.wordWrap = true;
			alert._tf.height = alert._tf.textHeight + 5;
			
			mc.height = alert._tf.height > SFApplication.application.stageHeight - alert._leading*2?
				SFApplication.application.stageHeight - alert._leading*2:alert._tf.height + alert._leading*2;
			
			mc.x = (SFApplication.application.stageWidth - mc.width)/2;
			mc.y = (SFApplication.application.stageHeight - mc.height)/2;
			alert.addChildAt(mc,1);
			alert._tf.x = mc.x + alert._leading;
			alert._tf.y = mc.y + alert._leading;
			
			var mc2 : MovieClip = new okBtn();
			mc2.x = mc.x + mc.width - mc2.width;
			mc2.y = mc.y + mc.height;
			mc2.addEventListener(MouseEvent.MOUSE_DOWN,hideHandle);
			mc2.controler = alert;
			alert.addChild(mc2);
			
			SFApplication.application.addChild(alert);
		}
		
		public static function hideHandle(event : MouseEvent) : void
		{
			event.currentTarget.removeEventListener(MouseEvent.MOUSE_DOWN,hideHandle);
			var alert : SFAlert = event.currentTarget.controler;
			while(alert.numChildren>0) {
				alert.removeChildAt(0);
			}
			SFApplication.application.removeChild(alert);
			System.gc();
		}
	}
}