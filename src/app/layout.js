import "./globals.css";
import Navbar from "../../components/Navbar";

export const metadata = {
  title: "GIKI Ride | Campus Ride Sharing",
  description: "The official ride-sharing platform for GIKI students.",
};

export default function RootLayout({ children }) {
  return (
    <html lang="en">
      <body>
        <div className="hero-bg" />
        <Navbar />
        <main>
          {children}
        </main>
      </body>
    </html>
  );
}
