'use client';

import { motion } from 'framer-motion';
import { Plus, Search, Navigation, User, Settings, History, Car, MapPin } from 'lucide-react';
import GlassCard from '../../../components/GlassCard';
import Link from 'next/link';

export default function Dashboard() {
  const quickActions = [
    { icon: <Plus size={24} />, title: 'Offer a Ride', color: 'var(--primary)', desc: 'Share your journey with others' },
    { icon: <Search size={24} />, title: 'Find a Ride', color: 'var(--secondary)', desc: 'Book a seat in an active ride' },
    { icon: <History size={24} />, title: 'History', color: 'var(--accent)', desc: 'View your previous trips' },
  ];

  return (
    <div className="container" style={{ padding: '40px 24px' }}>
      <header style={{ marginBottom: '40px' }}>
        <h1 style={{ fontSize: '36px', marginBottom: '8px' }}>Hello, <span className="gradient-text">Gikian</span></h1>
        <p style={{ color: 'var(--text-muted)' }}>Welcome to your ride-sharing dashboard</p>
      </header>

      <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fit, minmax(300px, 1fr))', gap: '24px', marginBottom: '48px' }}>
        {quickActions.map((action, i) => (
          <motion.div
            key={i}
            initial={{ y: 20, opacity: 0 }}
            animate={{ y: 0, opacity: 1 }}
            transition={{ delay: i * 0.1 }}
            whileHover={{ translateY: -5 }}
            style={{ cursor: 'pointer' }}
          >
            <GlassCard>
              <div style={{ background: `${action.color}20`, padding: '16px', borderRadius: '16px', width: 'fit-content', marginBottom: '20px', color: action.color }}>
                {action.icon}
              </div>
              <h3 style={{ fontSize: '20px', marginBottom: '8px' }}>{action.title}</h3>
              <p style={{ color: 'var(--text-muted)', fontSize: '14px' }}>{action.desc}</p>
            </GlassCard>
          </motion.div>
        ))}
      </div>

      <section>
        <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: '24px' }}>
          <h2 style={{ fontSize: '24px' }}>Active Rides Near You</h2>
          <Link href="/map" style={{ color: 'var(--primary)', textDecoration: 'none', fontSize: '14px', fontWeight: '600' }}>View All on Map</Link>
        </div>

        <div style={{ display: 'flex', flexDirection: 'column', gap: '16px' }}>
          {[1, 2].map((ride) => (
            <motion.div
              key={ride}
              initial={{ x: -20, opacity: 0 }}
              animate={{ x: 0, opacity: 1 }}
              transition={{ delay: 0.3 + ride * 0.1 }}
            >
              <GlassCard style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
                <div style={{ display: 'flex', gap: '20px', alignItems: 'center' }}>
                  <div style={{ width: '60px', height: '60px', borderRadius: '50%', background: 'var(--glass)', border: '1px solid var(--surface-border)', display: 'flex', alignItems: 'center', justifyContent: 'center' }}>
                    <Car size={24} color="var(--primary)" />
                  </div>
                  <div>
                    <h4 style={{ fontSize: '18px', marginBottom: '4px' }}>To: Main Gate</h4>
                    <p style={{ color: 'var(--text-muted)', fontSize: '14px', display: 'flex', alignItems: 'center', gap: '4px' }}>
                      <User size={14} /> Ali Hamza • 4.8★
                    </p>
                  </div>
                </div>
                <div style={{ textAlign: 'right' }}>
                  <p style={{ fontSize: '18px', fontWeight: '700', color: 'var(--secondary)', marginBottom: '4px' }}>Rs. 50</p>
                  <p style={{ color: 'var(--text-muted)', fontSize: '12px' }}>Leaving in 10 mins</p>
                </div>
                <button className="btn-primary" style={{ padding: '8px 20px', borderRadius: '8px' }}>
                  Join
                </button>
              </GlassCard>
            </motion.div>
          ))}
        </div>
      </section>
    </div>
  );
}
