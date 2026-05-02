/** @type {import('next').NextConfig} */
const nextConfig = {
  output: 'export',
  images: {
    unoptimized: true,
  },
  // If deploying to GitHub Pages as a project site, uncomment the lines below:
  // basePath: '/giki-ride',
  // assetPrefix: '/giki-ride',
};

export default nextConfig;
