package cn.sftech.www.view
{
	import flash.events.MouseEvent;

	/**
	 * 
	 * @author LiYunpeng
	 */	
	public class SFButton extends SFSprite
	{
		private var _btnLabel : SFLabel;
		
		public function SFButton()
		{
			super();
			init();
		}
		
		private function init() : void
		{
//			_btnLabel = new BdcLabel();
//			label = "button";
//			addChild(_btnLabel);
		}
		
		public function set label(_text : String) : void
		{
//			_btnLabel.text = _text;
		}
		
	}
}