package 'telnet' do
  action :remove
end

# disable loading kernel modules
# no sound or video on these devices
modules = %w(
  bcm2835_v4l2
  vc4
  snd
  snd_bcm2835
  snd_pcm_dmaengine
  snd_soc_core
  snd_pcm
  snd_timer
  v4l2_common
  videobuf2_vmalloc
  bcm2835_codec
  v4l2_mem2mem
  bcm2835_mmal_vchiq
  videobuf2_dma_contig
  videobuf2_memops
  videobuf2_v4l2
  videobuf2_common
  videodev
  media
  vc_sm_cma
  v3d
  gpu_sched
  drm
  drm_panel_orientation_quirks
  rpivid_mem
)

modules.each do |mod|
  kernel_module mod do
    action :uninstall
    ignore_failure true
  end
end
