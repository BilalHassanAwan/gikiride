import Link from 'next/link';
import { Car, MapPin, User, Bell } from 'lucide-react';

export default function Navbar() {
  return (
    <nav className="glass-nav">
      <div className="container" style={{ height: '72px', display: 'flex', alignItems: 'center', justifyContent: 'space-between' }}>
        <Link href="/" style={{ fontSize: '24px', fontWeight: '800', color: 'var(--primary)', textDecoration: 'none', display: 'flex', alignItems: 'center', gap: '8px' }}>
          <Car size={32} />
          <span>GIKI <span style={{ color: 'var(--secondary)' }}>Ride</span></span>
        </Link>

        <div style={{ display: 'flex', gap: '32px', alignItems: 'center' }}>
          <Link href="/dashboard" style={{ color: 'var(--text)', textDecoration: 'none', fontWeight: '500' }}>Dashboard</Link>
          <Link href="/map" style={{ color: 'var(--text)', textDecoration: 'none', fontWeight: '500' }}>Book Ride</Link>
          <div style={{ display: 'flex', gap: '16px', marginLeft: '16px' }}>
            <Bell size={20} color="var(--text-muted)" style={{ cursor: 'pointer' }} />
            <User size={20} color="var(--text-muted)" style={{ cursor: 'pointer' }} />
          </div>
        </div>
      </div>
    </nav>
  );
}
