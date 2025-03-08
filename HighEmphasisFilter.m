function high_emph_image = HighEmphasisFilter(name)
og_im=name;
freq_space = fft2(og_im);
[f1,f2] = freqspace(size(freq_space), 'meshgrid' );
D = sqrt(f1.^2 + f2.^2);
H_b=1./((1+0.1./D).^2);  %Butterworth high-pass filter
H_em=0.5+0.75*H_b; %High frequency emphasis filter
H_em=ifftshift(H_em);
high_emph_filtered = freq_space.*H_em;
image_space = uint8(ifft2(high_emph_filtered));
high_emph_image = histeq(abs(image_space));
end

