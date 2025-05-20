package mono.com.canhub.cropper;


public class CropImageView_OnCropImageCompleteListenerImplementor
	extends java.lang.Object
	implements
		mono.android.IGCUserPeer,
		com.canhub.cropper.CropImageView.OnCropImageCompleteListener
{
/** @hide */
	public static final String __md_methods;
	static {
		__md_methods = 
			"n_onCropImageComplete:(Lcom/canhub/cropper/CropImageView;Lcom/canhub/cropper/CropImageView$CropResult;)V:GetOnCropImageComplete_Lcom_canhub_cropper_CropImageView_Lcom_canhub_cropper_CropImageView_CropResult_Handler:Com.Canhub.Cropper.CropImageView/IOnCropImageCompleteListenerInvoker, Com.Vanniktech.AndroidImageCropper.Maui\n" +
			"";
		mono.android.Runtime.register ("Com.Canhub.Cropper.CropImageView+IOnCropImageCompleteListenerImplementor, Com.Vanniktech.AndroidImageCropper.Maui", CropImageView_OnCropImageCompleteListenerImplementor.class, __md_methods);
	}


	public CropImageView_OnCropImageCompleteListenerImplementor ()
	{
		super ();
		if (getClass () == CropImageView_OnCropImageCompleteListenerImplementor.class) {
			mono.android.TypeManager.Activate ("Com.Canhub.Cropper.CropImageView+IOnCropImageCompleteListenerImplementor, Com.Vanniktech.AndroidImageCropper.Maui", "", this, new java.lang.Object[] {  });
		}
	}


	public void onCropImageComplete (com.canhub.cropper.CropImageView p0, com.canhub.cropper.CropImageView.CropResult p1)
	{
		n_onCropImageComplete (p0, p1);
	}

	private native void n_onCropImageComplete (com.canhub.cropper.CropImageView p0, com.canhub.cropper.CropImageView.CropResult p1);

	private java.util.ArrayList refList;
	public void monodroidAddReference (java.lang.Object obj)
	{
		if (refList == null)
			refList = new java.util.ArrayList ();
		refList.add (obj);
	}

	public void monodroidClearReferences ()
	{
		if (refList != null)
			refList.clear ();
	}
}
