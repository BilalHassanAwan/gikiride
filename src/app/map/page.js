'use client';

import { motion } from 'framer-motion';
import { Search, MapPin, Navigation, Send, Info, Filter, SlidersHorizontal } from 'lucide-react';
import GlassCard from '../../../components/GlassCard';
import { useState } from 'react';

export default function MapPage() {
  const [destination, setDestination] = useState('');

  return (
    <div style={{ height: 'calc(100vh - 72px)', position: 'relative', overflow: 'hidden' }}>
      {/* Mock Map Background */}
      <div style={{ 
        position: 'absolute', 
        top: 0, 
        left: 0, 
        right: 0, 
        bottom: 0, 
        background: 'radial-gradient(circle at 50% 50%, #1e293b 0%, #0f172a 100%)',
        zIndex: -1
      }}>
        {/* Simple Mock Map Elements */}
        <div style={{ position: 'absolute', top: '20%', left: '30%', width: '12px', height: '12px', background: 'var(--primary)', borderRadius: '50%', boxShadow: '0 0 20px var(--primary)' }} />
        <div style={{ position: 'absolute', top: '60%', left: '70%', width: '12px', height: '12px', background: 'var(--secondary)', borderRadius: '50%', boxShadow: '0 0 20px var(--secondary)' }} />
        <div style={{ position: 'absolute', top: '40%', left: '50%', width: '12px', height: '12px', background: 'var(--accent)', borderRadius: '50%', boxShadow: '0 0 20px var(--accent)' }} />
        
        {/* Mock Road Lines */}
        <svg width="100%" height="100%" style={{ opacity: 0.1 }}>
          <line x1="0" y1="20%" x2="100%" y2="80%" stroke="white" strokeWidth="1" />
          <line x1="0" y1="80%" x2="100%" y2="20%" stroke="white" strokeWidth="1" />
          <line x1="50%" y1="0" x2="50%" y2="100%" stroke="white" strokeWidth="1" />
        </svg>
      </div>

      {/* Floating UI Elements */}
      <div className="container" style={{ height: '100%', pointerEvents: 'none' }}>
        <div style={{ 
          display: 'flex', 
          flexDirection: 'column', 
          height: '100%', 
          padding: '24px 0',
          justifyContent: 'space-between'
        }}>
          {/* Top Search Bar */}
          <motion.div 
            initial={{ y: -20, opacity: 0 }}
            animate={{ y: 0, opacity: 1 }}
            style={{ pointerEvents: 'auto', maxWidth: '500px', width: '100%' }}
          >
            <GlassCard style={{ padding: '12px' }}>
              <div style={{ display: 'flex', alignItems: 'center', gap: '12px' }}>
                <Search size={20} color="var(--text-muted)" />
                <input 
                  type="text" 
                  placeholder="Where are you going?" 
                  value={destination}
                  onChange={(e) => setDestination(e.target.value)}
                  style={{ 
                    flex: 1, 
                    background: 'transparent', 
                    border: 'none', 
                    color: 'var(--text)', 
                    outline: 'none',
                    fontSize: '16px' 
                  }} 
                />
                <div style={{ width: '1px', height: '24px', background: 'var(--surface-border)' }} />
                <SlidersHorizontal size={20} color="var(--primary)" style={{ cursor: 'pointer' }} />
              </div>
            </GlassCard>
          </motion.div>

          {/* Bottom Controls */}
          <div style={{ display: 'flex', flexDirection: 'column', gap: '16px', pointerEvents: 'auto' }}>
            <div style={{ display: 'flex', justifyContent: 'flex-end', gap: '12px' }}>
              <button style={{ width: '48px', height: '48px', borderRadius: '12px', background: 'var(--surface)', border: '1px solid var(--surface-border)', color: 'var(--text)', display: 'flex', alignItems: 'center', justifyContent: 'center', backdropFilter: 'blur(10px)', cursor: 'pointer' }}>
                <Navigation size={20} />
              </button>
            </div>

            <motion.div
              initial={{ y: 50, opacity: 0 }}
              animate={{ y: 0, opacity: 1 }}
              transition={{ delay: 0.2 }}
            >
              <GlassCard>
                <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'flex-start', marginBottom: '20px' }}>
                  <div>
                    <h3 style={{ fontSize: '20px', marginBottom: '4px' }}>Confirm Destination</h3>
                    <p style={{ color: 'var(--text-muted)', fontSize: '14px' }}>Select your preferred ride type</p>
                  </div>
                  <Info size={18} color="var(--text-muted)" />
                </div>

                <div style={{ display: 'flex', gap: '12px', marginBottom: '24px' }}>
                  {['Standard', 'Premium', 'Shared'].map((type, i) => (
                    <div key={type} style={{ 
                      flex: 1, 
                      padding: '16px 8px', 
                      textAlign: 'center', 
                      background: i === 0 ? 'var(--primary)20' : 'var(--glass)', 
                      border: i === 0 ? '1px solid var(--primary)' : '1px solid var(--surface-border)', 
                      borderRadius: '12px',
                      cursor: 'pointer'
                    }}>
                      <div style={{ fontSize: '14px', fontWeight: '600', marginBottom: '4px' }}>{type}</div>
                      <div style={{ fontSize: '12px', color: 'var(--text-muted)' }}>Rs. {50 + i * 25}</div>
                    </div>
                  ))}
                </div>

                <button className="btn-primary" style={{ width: '100%', justifyContent: 'center', padding: '16px', fontSize: '18px' }}>
                  Request Ride <Send size={20} />
                </button>
              </GlassCard>
            </motion.div>
          </div>
        </div>
      </div>
    </div>
  );
}
