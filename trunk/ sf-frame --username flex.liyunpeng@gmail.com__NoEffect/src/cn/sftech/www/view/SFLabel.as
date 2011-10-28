package cn.sftech.www.view
{
	/**
	 * Label文本框，不可选择文本内容的文本框
	 * @author LiYunpeng
	 * 
	 */	
	public class SFLabel extends SFTextField
	{
		public function SFLabel()
		{
			super();
			init();
		}
		
		private function init() : void
		{
			super.selectable = false;
		}
	}
}